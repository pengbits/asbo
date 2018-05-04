
Then("the platform will contain an episode with this media property") do |media|
  @ep = @platform.episodes.first
  expect(@ep.media).to eq(media.hashes.first)
end

Given("I have a media object with a url and a valid type") do
  @media = {
    media: {
      url: "https://soundcloud.com/rinsefm/theheatwave020518",
      type: "soundcloud"
    }
  }
end

Given("I have a media object with a url and an invalid type") do
  @media = {
    media: {
      type: "foo"
    }
  }
end

When("I post the attributes to the media endpoint") do
  post "/media", @media
  @response = last_response.body
  @json = JSON.parse(@response)
end

Then("I will get an embed back") do
  # pending # Write code here that turns the phrase above into concrete actions
  expect(@json['html']).to be_truthy
end

Then("I will get an error") do
  expect(@json['error']).to include("invalid type")
end

