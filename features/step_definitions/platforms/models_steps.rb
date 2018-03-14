Given("a platform with valid attributes") do
  @platform_attrs = get_platform_attrs(0) # {name:"nts"}
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

Given("these changes") do
  @attrs = {name: 'WibblePlatform', nickname:'wibble', url: 'wibble.net'}
end

When("I make a PUT request to platform endpoint") do
  @nick = @platforms.first.nickname # nts
  url = "/platforms/#{@nick}"
  @json = {platform: @attrs}
  put url, @json
end

Then("I should get a valid response containing the platform") do
  @response = last_response.body
  puts @response
  expect(@response).to be_truthy
end

Then("the platform in the response should reflect the changes") do
  @json = JSON.parse(@response)
  expect(@json[:name]).to      eq(@attrs['name'])
  expect(@json[:nickname]).to  eq(@attrs['nickname'])
  expect(@json[:url]).to       eq(@attrs['url'])
end



