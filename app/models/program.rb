class Program
  KEYS = %i[kids jiu_jitsu no_gi boxing mma].freeze

  IMAGES = {
    kids: "programs/kids1.jpg",
    jiu_jitsu: "programs/gi1.jpg",
    no_gi: "programs/nogi1.jpg",
    boxing: "programs/boxeo1.jpg",
    mma: "programs/mma1.jpg"
  }.freeze

  INSTRUCTOR_IMAGES = {
    kids: %w[programs/kids-instructor-1.jpg programs/kids-instructor-2.jpg]
  }.freeze

  attr_reader :key

  def self.all
    KEYS.map { |key| new(key) }
  end

  def self.find(param)
    key = param.to_s.tr("-", "_").to_sym
    new(KEYS.include?(key) ? key : KEYS.first)
  end

  def initialize(key)
    @key = key
  end

  def to_param
    key.to_s.dasherize
  end

  def image
    IMAGES.fetch(key)
  end

  def title
    translate(:title)
  end

  def subtitle
    translate(:subtitle)
  end

  def summary
    translate(:summary)
  end

  def schedule
    translate(:schedule, default: [])
  end

  def benefits
    translate(:benefits, default: [])
  end

  def instructors
    images = INSTRUCTOR_IMAGES.fetch(key, [])
      translate(:instructors, default: []).each_with_index.map do |data, index|
      data.merge(image: images[index])
    end
  end

  private

  def translate(attribute, **options)
    I18n.t("programs.#{key}.#{attribute}", **options)
  end
end
