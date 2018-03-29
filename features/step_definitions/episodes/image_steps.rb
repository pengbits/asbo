Given("the platform has relative_image_paths={string}") do |mode|
  # puts @platform.episodes.first
  @platform.use_relative_images = mode
end

Then("the platform will contain an episode with this image {string}") do |src|
  puts "expecting #{src}"
  @ep = @platform.episodes.find do |ep|
    ep.image == src
  end
  expect(@ep).to be_truthy
end