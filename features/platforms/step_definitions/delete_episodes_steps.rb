
When("I make a DELETE request to the platform's episodes endpoint") do
  @platform = @platforms.first
  @nick = @platform.nickname
  url = "/platforms/#{@nick}/episodes"
  delete url
end

Then("the platform in the response should not contain any episodes") do
  @response = JSON.parse(last_response.body)
  expect(@response['success']).to be_truthy
  expect(@response['platform']['episodes'].length).to eq 0
end

Then("the platform should still exist") do
  @platform = Platform.find_by_nickname @nick
  expect(@platform).to be_truthy
end