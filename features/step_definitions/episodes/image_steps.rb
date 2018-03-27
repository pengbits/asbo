Given("the platform has use_relative_image_paths={string}") do |mode|
  @platform.use_relative_image_paths= (mode == 'true')
  puts "#{@platform.name}.use_relative_image_paths= #{relative} "
end

Then("the platform will contain an episode with this image {string}") do |src|
  @ep = @platform.episodes.find do |ep|
    ep.image == src
  end
  expect(@ep).to be_truthy
end