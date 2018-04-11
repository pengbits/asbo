When("I set the default image to {string}") do |src|
  @platform_attrs[:default_image] = src
  @default_image = src
end

# And I save it...
# Then I should see the new platform in the list  ..

Then("I should see the default image in the platform") do
  @platform = JSON.parse(@response).first
  expect(@platform['default_image']).to eq(@default_image)
end