Given("these platforms") do
  @platforms = get_platforms
end

Given /the platform nickname=(.+)$/ do |nickname|
  @platform = get_platform_by_nickname nickname
end
