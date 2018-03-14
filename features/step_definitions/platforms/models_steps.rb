Given("a platform with valid attributes") do
  @platform_attrs = get_platform_attrs(0) # {name:"RinseFM"}
end

When("I save it") do
  @platform = Platform.create(@platform_attrs)
end

Then("I should see the new platform in the list") do
  get "/platforms"
  @response = last_response.body
  expect(@response).to include(@platform.to_json)
end

When("I make a POST request to platforms endpoint with valid JSON") do |json|
  @json = JSON.parse(json)
  post platforms_path, @json
end


When("I make a DELETE request to platform endpoint") do
  @nick = @platforms.first.nickname
  url = "/platforms/#{@nick}"
  delete url
end

When("I make a PUT request to platform endpoint") do
  @nick = @platforms.first.nickname
  url = "/platforms/#{@nick}"
  @json = @attrs
  put url, @json
end


Then("the response should be success") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should get a valid response containing the platform") do
  @response = last_response.body
  puts @response
  expect(@response).to be_truthy
end

Given("these changes") do
  @attrs = {name: 'WibblePlatform', nickname:'wibble', url: 'wibble.net'}
end

Then("the response should include an updated platform") do
  pending # Write code here that turns the phrase above into concrete actions
end


