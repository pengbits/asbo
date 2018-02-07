
Given("the following platforms:") do |platforms|
  @platforms = Platform.create!(platforms.hashes)
  expect(@platforms.length).to eq(platforms.hashes.length)
end

When("I load the platform endpoint with key: {string}") do |key|
  get "/platforms/#{key}"
  @params = {:key => key}
  @response = last_response.body
end

Then("The response should be a JSON representation of the platform") do
  @platform = @platforms.find{|p| p.key == @params[:key] }
  expect(@response).to eq(@platform.to_json)
end