When("I set a default image") do
  @platform_attrs[:default_image] = 'http://getdarker-cdn-2ezlhsfwy1f.stackpathdns.com/wp-content/uploads/2006/02/27347_logo1112.png'
  @default_image = @platform_attrs[:default_image]
end

# And I save it...
# Then I should see the new platform in the list  ..

Then("I should see the default image in the platform") do
  @platform = JSON.parse(@response).first
  expect(@platform['default_image']).to eq(@default_image)
  # pending # Write code here that turns the phrase above into concrete actions
end