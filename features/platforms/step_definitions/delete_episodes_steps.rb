
When("I make a DELETE request to the platform's episodes endpoint") do
  @platform = @platforms.first
  @nick = @platform.nickname
  url = "/platforms/#{@nick}/episodes"
  delete url
end


