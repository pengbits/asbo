Given("these attributes") do |attrs|
  @platform_attrs = JSON.parse(attrs)
  puts @platform_attrs
  # pending # Write code here that turns the phrase above into concrete actions
end

When("I save it") do
  @platform = Platform.create!(@platform_attrs)
end

Then("I should see the new platform in the list") do
  get "/platforms"
  @response = last_response.body
  puts "response"
  puts @response
  puts "model.to_json"
  puts @platform.to_json
  expect(@response).to include(@platform.to_json)
end

