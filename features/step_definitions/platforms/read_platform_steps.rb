When("I load the platform endpoint") do |attrs|
  platform = JSON.parse(attrs)
  @nickname = platform['nickname']
  @filter   = platform['filter'] unless platform['filter'].nil?
  puts "filter: #{@filter}"
  url = platform_path(:nickname => @nickname, :filter => @filter)
  puts url
  get url
  @response = JSON.parse(last_response.body)
end

Then("the response should be a JSON representation of the platform") do
  @platform = @platforms.find{|p| p.nickname == @nickname }
  expect(@platform.name).to eq(@response['name'])
  expect(@platform.id).to   eq(@response['id'])
  expect(@platform.nickname).to  eq(@response['nickname'])
  expect(@platform.url).to  eq(@response['url'])
end

Then("the response should be a platform not found error") do
  expect(last_response.status).to eq(500)
  expect(@response).to eq({"error" => "Couldn't find Platform"})
end

Then("the response should be the platform with an array of matching episodes") do
  @platform = @platforms.find{|p| p.nickname == @nickname }
  puts @platform.nickname
  puts @response['episodes'].length
  puts @response.is_a?(Hash)
  # pending # Write code here that turns the phrase above into concrete actions
end

