Given("the platform has relative_image_paths={string}") do |mode|
  # puts @platform.episodes.first
  @platform.use_relative_images = mode
end

Then("the platform will contain an episode with this image {string}") do |src|
  @ep = @platform.episodes.find do |ep|
    ep.image == src
  end
  expect(@ep).to be_truthy
end

Then("the episode will have this fallback image {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
