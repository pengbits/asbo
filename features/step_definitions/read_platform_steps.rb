When("I load the platform endpoint {string}") do |url|
  get url
  @response = JSON.parse(last_response.body)
  @nickname = url.split('/platforms/')[1]
end

Then("the response should be a JSON representation of the platform") do
  @platform = @platforms.find{|p| p.nickname == @nickname }
  expect(@platform.name).to eq(@response['name'])
  expect(@platform.id).to   eq(@response['id'])
  expect(@platform.nickname).to  eq(@response['nickname'])
  expect(@platform.url).to  eq(@response['url'])
end

Then("the response should be an error") do
  expect(last_response.status).to eq(500)
  expect(@response).to eq({"error" => "Platform not found"})
end

