When("I set these post-processing rules") do |json|
  @rules = JSON.parse(json)
  @platform_attrs[:post_processing_rules] = @rules
end

Then("It should have the post-processing rule") do
  expect(@platform.post_processing_rules).to eq(@rules)
end
