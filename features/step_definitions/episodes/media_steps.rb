
Then("the platform will contain an episode with this media property") do |media|
  @ep = @platform.episodes.first
  expect(@ep.media).to eq(media.hashes.first)
end
