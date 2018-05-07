
Then("the platform will contain an episode with this media property") do |media|
  @ep = @platform.episodes.first
  expect(@ep.media).to eq(media.hashes.first)
end

Given("I have a media object") do |attrs|
  @media = {
    media: JSON.parse(attrs)
  }
end

When("I post the attributes to the media endpoint") do
  post "/media", @media
  @response = last_response.body
  puts @response
  @json = JSON.parse(@response)
end

Then("I will get this embed back") do |html|
  # pending # Write code here that turns the phrase above into concrete actions
  puts @json['html']
  expect(@json['html']).to be_truthy
  expect(@json['html']).to eq(html)
end

Then("I will get an error") do
  expect(@json['error']).to include("invalid type")
end

