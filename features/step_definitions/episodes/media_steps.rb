
Then("the platform will contain an episode with this media property") do |media|
  media.map_headers!{|header| header.to_sym}

  @ep = @platform.episodes.first
  expect(@ep.media).to eq(media.hashes.first)
end
