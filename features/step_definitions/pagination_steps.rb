Given("a platform with pagination rules") do |attrs|
  @provider_attrs = JSON.parse(attrs)
  @platform = Platform.create(@provider_attrs)
end

When("I call refresh with a page parameter") do
  @page_num = 3
  (1..3).each do |i|
    @platform.refresh(:page => i)
  end
end

Then("the platform should have the correct episodes") do
  item_count = @page_num * @provider_attrs['pagination']['itemsPerPage']
  # puts @platform.episodes.collect {|p| p.name}
  expect(@platform.episodes.length).to eq(item_count)
  
end