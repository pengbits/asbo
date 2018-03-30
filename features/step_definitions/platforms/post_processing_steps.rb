When("I set these post-processing rules") do |json|
  @platform_attrs[:post_processing_rules] = JSON.parse(json)
end

Then("It should have the post-processing rule") do
  puts @platform
end
