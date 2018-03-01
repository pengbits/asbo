
Given(/the platform has details=(false|true) in its configuration/) do |has_details_str|
  @platform.has_details = (has_details_str == "true")
end

Given("html for an episode") do |html|
  @html = html
end

When("I parse the html") do
  @platform.create_episodes_from_html @html
end

Then("the platform will contain an episode with this url") do |details_url|
  @ep = @platform.episodes.first
  expect(@ep.details).to eq(details_url)
end

Then("the platform will not contain any details urls in its episodes") do
  expect(@platform.episodes).not_to be_empty
  @eps_with_details = @platform.episodes.select {|ep| ep.details }
  expect(@eps_with_details).to be_empty
end