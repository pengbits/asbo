Given("these episodes") do |attr_array|
  @episodes = Episode.create(JSON.parse(attr_array))
end
