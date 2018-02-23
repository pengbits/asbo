Given("a platform with pagination rules") do |attrs|
  @provider_attrs = JSON.parse(attrs)
  @platform = Platform.create(@provider_attrs)
end


Then("the url is correctly formatted") do
  puts @url
end

When("I call refresh with a page parameter") do
  @page_num = 2
  @results_by_page = {}
  (1..@page_num).each do |i|
    @platform.refresh(:page => i)
  end
end

Then("the platform should have the correct episodes") do
  item_count = @page_num * @provider_attrs['pagination']['itemsPerPage']
  # puts @platform.episodes.collect {|p| p.name}
  puts "found #{@platform.episodes.length} episodes"
  expect(@platform.episodes.length).to eq(item_count)
end

When("I visit {string}") do |url_with_page_param|
  page = url_with_page_param.split('?page=')[1]
  get url_with_page_param
  
  @responses = @responses || {} 
  @responses[page] = JSON.parse(last_response.body)['episodes']
end

Then("each response should contain different episodes") do
  if @responses.keys.length > 1
    alpha = @responses.keys.first
    beta  = @responses.keys.last
    
    puts "comparing @responses[#{alpha}] and @responses[#{beta}] to ensure they are distinct..."
    expect(@responses[alpha]).not_to match_array(@responses[beta])
  end
end
