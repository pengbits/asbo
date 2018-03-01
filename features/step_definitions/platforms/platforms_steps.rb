Given("these platforms") do
  @platforms = get_platforms
end

Given /the platform key=(.+)$/ do |key|
  @platform = get_platform_by_key key
end
