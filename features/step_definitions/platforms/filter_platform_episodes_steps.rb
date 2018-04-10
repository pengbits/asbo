# see ../episodes/filter_episodes.rb
When("I load the platform endpoint {string}") do |url|
  puts "GET #{url}"
  get url
  @response = last_response.body
end
