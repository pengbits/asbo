Given("this date {string}") do |d|
  @date_str = d
end

Given("this date format {string}") do |f|
  @date_format = f
end

When("I set the date_str for the episode") do
  @platform = Platform.create({
    name:'nts.live', 
    url: "https://www.nts.live/recently-added",
    date_format: @date_format
  })
  @platform.episodes.create({
    name: "Ossia 06.02.18 Radio Episode",
    date_str: "06.02.18"
  })

  @episode = @platform.episodes.first
end

Then("the date will be correct") do
  # puts @episode.date
  # puts @episode.date_proper
  # @date = Date.strptime(@episode.date, @platform.date_format)
  puts @date
  # expect(@date).to eq(@episode.date_proper)
end
