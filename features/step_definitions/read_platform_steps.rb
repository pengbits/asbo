When("I load the platform endpoint {string}") do |url|
  get url
  @response = last_response.body
end

Then("the response should be a JSON representation of the platform") do
  puts last_response.params
  @platform = @platforms.find{|p| p.key == @params[:key] }
  # expect(@response).to eq(@platform.to_json)
end

Then("the response should be an error") do
  @response = JSON.parse(last_response.body)
  expect(last_response.status).to eq(500)
  expect(@response).to eq({"error" => "Platform not found"})
end

