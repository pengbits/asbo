Given("this date {string}") do |d|
  @date_str = d
end

Given("this date format {string}") do |f|
  @date_format = f
  @year_in_format = !!@date_format.match(/%([yY])/)
end

Given("this implicit year {string}") do |string|
  @implicit_year = string # doesnt actually do anything..
end

When("I set the date_str for the episode") do
  @platform = Platform.create({
    name:'nts.live', 
    url: "https://www.nts.live/recently-added",
    date_format: @date_format
  })
  @platform.episodes.create({
    name: "Ossia #{@date_str} {Radio Episode",
    date_str: @date_str
  })

  @episode = @platform.episodes.first
end

Then("episode.date.to_s will be {string}") do |date|
  expect(@episode.date.to_s).to eq(date)
end