Given("these attributes") do |attrs|
  @platform_attrs = JSON.parse(attrs)
end

When("I save it") do
  @platform = Platform.create!(@platform_attrs)
end

Then("I should see the new platform in the list") do
  get "/platforms"
  @response = last_response.body
  expect(@response).to include(@platform.to_json)
end

