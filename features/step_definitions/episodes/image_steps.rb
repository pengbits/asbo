Given("the platform has relative_image_paths={string}") do |mode|
  # puts @platform.episodes.first
  @platform.use_relative_images = mode
end

Given("the platform has this default image {string}") do |string|
  @platform.default_image = string
  @platform.save
end

Then("the platform will contain an episode with this image {string}") do |src|
  @ep = @platform.episodes.find do |episode|
    # in controller...
    # episode.attributes_minimal['image'] == src
    # otherwise, since episode.image is not altered.. 
    episode.image_with_fallback == src
  end
  expect(@ep).to be_truthy
end