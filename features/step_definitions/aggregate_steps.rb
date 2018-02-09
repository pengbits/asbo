Given("these platforms") do
  Platform.create([{
    name: "nts.live",
    key:  "nts",
    url:  "https://www.nts.live/recently-added",
    date_format: "%d.%m.%y"
  },{
    name: "rinse.fm",
    key:  "rinse",
    url:  "http://rinse.fm/podcasts",
    date_format: "%Y-%m-%d"
  }])
end

Given("these episodes") do |attr_array|
  Episode.create!(JSON.parse(attr_array))
end


When("I view list sorted by date") do
  @episodes = Episode.order(:date)
  # @episodes.each {|ep| puts "#{ep.platform.name} #{ep.date} #{ep.name}"}
end

Then("the list should include episodes from both rinse and nts") do
  @nts_eps   = @episodes.select{|ep| ep.platform_id == 1}
  @rinse_eps = @episodes.select{|ep| ep.platform_id == 2}
  expect(@nts_eps).not_to be_empty
  expect(@rinse_eps).not_to be_empty
  puts "found the following episodes: nts#{@nts_eps.length}, rinse:#{@rinse_eps.length}"
  
end
