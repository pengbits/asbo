
Then("the platform will contain an episode with this media property") do |obj|
  @ep = @platform.episodes.first
  # expect(@ep.media).to include("url", "type")
end
