namespace :cache do
  desc "List all cache keys"
  task list_all: :environment do
    puts "🔍 All Cache Keys:"
    puts "=" * 50

    if Rails.cache.respond_to?(:keys)
      keys = Rails.cache.keys
      if keys.any?
        keys.each do |key|
          size = Rails.cache.read(key).to_s.bytesize
          puts "✅ #{key} (#{size} bytes)"
        end
      else
        puts "❌ No cache keys found"
      end
    else
      puts "ℹ️  Cache store doesn't support listing keys"
      puts "Cache Store: #{Rails.cache.class.name}"
    end
  end

  desc "Clear hero section cache"
  task clear_hero: :environment do
    # Generar el cache key real
    component = Explore::HeroSectionComponent.new(cta_href: "/about")
    cache_key = component.send(:cache_key)

    cache_keys = [
      "hero_section/v1/explore_page",
      cache_key
    ]

    cache_keys.each do |key|
      if Rails.cache.exist?(key)
        Rails.cache.delete(key)
        puts "✅ Cleared cache key: #{key}"
      else
        puts "ℹ️  Cache key not found: #{key}"
      end
    end

    puts "\n🎯 Hero section cache cleared successfully!"
  end

  desc "Show hero section cache status"
  task hero_status: :environment do
    # Generar el cache key real
    component = Explore::HeroSectionComponent.new(cta_href: "/about")
    cache_key = component.send(:cache_key)

    cache_keys = [
      "hero_section/v1/explore_page",
      cache_key
    ]

    puts "🔍 Hero Section Cache Status:"
    puts "=" * 50

    cache_keys.each do |key|
      exists = Rails.cache.exist?(key)
      size = exists ? Rails.cache.read(key).to_s.bytesize : 0

      status = exists ? "✅ CACHED" : "❌ MISSING"
      puts "#{status} | #{key}"
      puts "   Size: #{size} bytes" if exists
      puts ""
    end

    puts "Cache Store: #{Rails.cache.class.name}"
  end

  desc "Warm up hero section cache"
  task warm_hero: :environment do
    puts "🔥 Warming up hero section cache..."

    begin
      component = Explore::HeroSectionComponent.new(cta_href: "/about")
      cache_key = component.send(:cache_key)

      # Force cache generation
      Rails.cache.write(cache_key, "warmed_up", expires_in: 1.hour)

      puts "✅ Hero section cache warmed up!"
      puts "   Cache key: #{cache_key}"
    rescue => e
      puts "❌ Error warming up cache: #{e.message}"
    end
  end

  desc "Test cache performance"
  task test_performance: :environment do
    puts "⚡ Testing cache performance..."

    component = Explore::HeroSectionComponent.new(cta_href: "/about")
    cache_key = component.send(:cache_key)

    # Test without cache
    start_time = Time.current
    10.times do
      component = Explore::HeroSectionComponent.new(cta_href: "/about")
    end
    without_cache_time = Time.current - start_time

    # Test with cache
    Rails.cache.write(cache_key, "cached_content", expires_in: 1.hour)
    start_time = Time.current
    10.times do
      Rails.cache.read(cache_key)
    end
    with_cache_time = Time.current - start_time

    puts "Without cache: #{without_cache_time.round(4)}s"
    puts "With cache: #{with_cache_time.round(4)}s"
    puts "Improvement: #{((without_cache_time - with_cache_time) / without_cache_time * 100).round(2)}%"
  end
end
