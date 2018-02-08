Given("these platforms") do
  Platform.create([{
    name: "nts.live",
    key:  "nts",
    url:  "https://www.nts.live/recently-added"
  },{
    name: "rinse.fm",
    key:  "rinse",
    url:  "http://rinse.fm/podcasts"
  }])
end

Given("these episodes") do |attr_array|
  Episode.create!(JSON.parse(attr_array))
end


When("I view list sorted by date") do
  @episodes = Episode.order(:date)
  @episodes.each {|ep| puts "#{ep.date} #{ep.name}"}
end

Then("the list should include episodes from both rinse and nts") do
  pending # Write code here that turns the phrase above into concrete actions
end
