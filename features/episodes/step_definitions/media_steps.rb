
Then("the platform will contain an episode with this media property") do |media|
  @ep = @platform.episodes.first
  expect(@ep.media).to eq(media.hashes.first)
end

Given("I have a media object with a url and a valid type") do
  @media = {
    media: {
      url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/438286137&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true",
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
end

Then("I will get an embed back") do
  # pending # Write code here that turns the phrase above into concrete actions
  puts @response
end

Then("I will get an error") do
  
end

