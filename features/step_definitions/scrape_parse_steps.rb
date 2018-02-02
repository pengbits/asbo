Given("this html for the episode") do |html|
  @html = html
end

When("I parse the HTML") do
  @episode = Episode.from_html(@html)
end

Then("I should get an object with these attributes:") do |attrs|
  @attrs = JSON.parse(attrs)
  expect(@episode).to have_attributes(@attrs)
end