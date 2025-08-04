require "test_helper"

class PathResolverTest < ViewComponent::TestCase
  class TestComponent < ViewComponent::Base
    include PathResolver

    def test_resolve_path(path_string)
      resolve_path(path_string)
    end
  end

  def setup
    @component = TestComponent.new
  end

  test "handles non-existent path helpers ending with _path" do
    # Paths ending with _path should return "#" as fallback
    result = @component.test_resolve_path("non_existent_path")
    assert_equal "#", result, "Paths ending with _path should return '#' as fallback"
  end

  test "handles non-existent path helpers ending with _path (another example)" do
    # Another example of non-existent path ending with _path
    result = @component.test_resolve_path("fake_page_path")
    assert_equal "#", result, "Paths ending with _path should return '#' as fallback"
  end

  test "preserves external URLs starting with https" do
    external_url = "https://example.com"
    result = @component.test_resolve_path(external_url)
    assert_equal external_url, result, "External URLs should be preserved"
  end

  test "preserves external URLs starting with http" do
    external_url = "http://example.com"
    result = @component.test_resolve_path(external_url)
    assert_equal external_url, result, "External URLs should be preserved"
  end

  test "preserves mailto links" do
    mailto_link = "mailto:test@example.com"
    result = @component.test_resolve_path(mailto_link)
    assert_equal mailto_link, result, "Mailto links should be preserved"
  end

  test "preserves tel links" do
    tel_link = "tel:+1234567890"
    result = @component.test_resolve_path(tel_link)
    assert_equal tel_link, result, "Tel links should be preserved"
  end

  test "handles arbitrary strings without _path suffix" do
    # Arbitrary strings without _path should return "#" as fallback
    result = @component.test_resolve_path("random_string")
    assert_equal "#", result, "Arbitrary strings should return '#' as fallback"
  end

  test "handles empty string" do
    result = @component.test_resolve_path("")
    assert_equal "#", result, "Empty string should return '#' as fallback"
  end

  test "handles complex external URLs" do
    complex_url = "https://www.google.com/maps?q=123+main+st"
    result = @component.test_resolve_path(complex_url)
    assert_equal complex_url, result, "Complex external URLs should be preserved"
  end

  test "handles mailto with subject and body" do
    complex_mailto = "mailto:test@example.com?subject=Hello&body=Message"
    result = @component.test_resolve_path(complex_mailto)
    assert_equal complex_mailto, result, "Complex mailto links should be preserved"
  end
end
