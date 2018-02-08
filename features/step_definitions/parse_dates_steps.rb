Given("this date {string}") do |d|
  @date_str = d
end

Given("this date format {string}") do |f|
  @date_format = f
end

When("I set the date for the episode") do
  @platform = Platform.new(name:'nts.live', date_format: @date_format)
  @platform.episodes.build({
    name: "Ossia 06.02.18 Radio Episode",
    date: "06.02.18"
  })
  puts @platform.episodes
end

Then("the date_proper will be correct") do
  pending # Write code here that turns the phrase above into concrete actions
end
