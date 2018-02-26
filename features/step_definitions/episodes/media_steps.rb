
Then("the platform will contain an episode with this media property") do |obj|
  media = JSON.parse(obj)
  expect(media).to include("url", "type")
end
