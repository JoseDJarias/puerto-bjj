module CacheHelper
  def cache_debug_info(cache_key)
    return unless Rails.env.development?

    cache_exists = Rails.cache.exist?(cache_key)
    cache_size = Rails.cache.exist?(cache_key) ? Rails.cache.read(cache_key).to_s.bytesize : 0

    content_tag :div, class: "cache-debug-info", style: "position: fixed; top: 10px; right: 10px; background: #333; color: white; padding: 10px; border-radius: 5px; font-size: 12px; z-index: 9999;" do
      content_tag :div, "Cache Key: #{cache_key}", style: "margin-bottom: 5px;" +
      content_tag(:div, "Cache Hit: #{cache_exists ? '✅ YES' : '❌ NO'}", style: "margin-bottom: 5px;") +
      content_tag(:div, "Cache Size: #{cache_size} bytes", style: "margin-bottom: 5px;") +
      content_tag(:div, "Generated: #{Time.current.strftime('%H:%M:%S')}", style: "font-size: 10px;")
    end
  end

  def cache_performance_info
    return unless Rails.env.development?

    content_tag :div, class: "cache-performance-info", style: "position: fixed; bottom: 10px; right: 10px; background: #333; color: white; padding: 10px; border-radius: 5px; font-size: 12px; z-index: 9999;" do
      content_tag :div, "Cache Store: #{Rails.cache.class.name}", style: "margin-bottom: 5px;" +
      content_tag(:div, "Cache Stats: #{cache_stats}", style: "font-size: 10px;")
    end
  end

  private

  def cache_stats
    if Rails.cache.respond_to?(:stats)
      stats = Rails.cache.stats
      "Hits: #{stats[:hits] || 'N/A'}, Misses: #{stats[:misses] || 'N/A'}"
    else
      "Stats not available"
    end
  end
end
