Given("this date {string}") do |d|
  @date_str = d
end

Given("this date format {string}") do |f|
  @date_format = f
end

When("I set the date for the episode") do
  @platform = Platform.new({
    name:'nts.live', 
    url: "https://www.nts.live/recently-added",
    date_format: @date_format
  })
  @platform.episodes.build({
    name: "Ossia 06.02.18 Radio Episode",
    date: "06.02.18"
  })
  
  @platform.save
  @episode = @platform.episodes.first
  
end

Then("the date_proper will be correct") do
  puts @episode.date
  puts @episode.date_proper
  @date = Date.strptime(@episode.date, @platform.date_format)
  puts @date
  expect(@date).to eq(@episode.date_proper)
end
