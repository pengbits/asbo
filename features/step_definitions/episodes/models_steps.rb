require_relative "../../../db/episodes"
Given("some episodes in the db") do
  @episodes = Episode.create!  EpisodeData::sample_attributes
end

When(/I load the episode endpoint with a (good|bad) id/) do |mode|
  i   = rand(@episodes.length)-1
  @ep = @episodes[i]
  @id = mode == 'bad' ? 1 : @ep.id
  url = "/episodes/#{@id}"
  puts "GET #{url}"
  get url
  @response = last_response.body
end

Then("the response should be a JSON representation of the episode") do
  puts @response
  expect(@response).to include(@ep.to_json)
end

Then("the response should be an episode not found error") do
  expect(last_response.status).to eq(500)
  error_json = {"error" => "Couldn't find Episode with 'id'=#{@id}"}.to_json
  expect(@response).to eq(error_json)
end
