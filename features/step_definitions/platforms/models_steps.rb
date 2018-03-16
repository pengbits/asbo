Given("a platform with valid attributes") do
  @platform_attrs = get_platform_attrs(0) # {name:"nts"}
end

When("I save it") do
  @platform = Platform.create(@platform_attrs)
end

Then("I should see the new platform in the list") do
  get "/platforms"
  @response = last_response.body
  expect(@response).to include(@platform.to_json)
end

When("I make a POST request to platforms endpoint with valid JSON") do |json|
  @json = JSON.parse(json)
  post platforms_path, @json
end

When("I make a DELETE request to platform endpoint") do
  @nick = @platforms.first.nickname
  url = "/platforms/#{@nick}"
  delete url
end

Given("these changes") do
  @attr_map_param = {
    item:      ".wibble-grid-item",
    name:      ".wibble-grid-item__img img[alt]",
    image:     ".wibble-grid-item__img img[src]",
    media:     ".wibble-grid-item__img__play-btn[data-src]",
    details:   ".wibble-grid-item__img__play-btn[data-permalink]",
    date_str:  ".wibble-grid-item__subtitle__left"
  }
  
  @pagination_param = {
    param: "wibblePage",
    itemsPerPage: "32"
  }

  @update = {
    id: 16,
    name: 'WibblePlatform', 
    nickname:'nts', 
    url: 'wibble.net',
    attr_map: @attr_map_param,
    pagination: @pagination_param
  }
end

When("I make a PUT request to platform endpoint") do
  @nick = @platforms.first.nickname # nts
  url = "/platforms/#{@nick}"
  @json = {platform: @update}
  puts "PUT #{url}"
  put url, @json
end

Then("I should get a valid response containing the platform") do
  @response = last_response.body
  expect(@response['error']).to be_nil
end

Then("the platform in the response should reflect the changes") do
  @json = JSON.parse(@response)
  # puts @json

  # top level props are straightforward enough..
  expect(@json['name']).to      eq(@update[:name])
  expect(@json['nickname']).to  eq(@update[:nickname])
  expect(@json['url']).to       eq(@update[:url])
  
  # the serializable props such as attr_map are trickier,
  # have to deserialize the value coming back in the response,
  # and then iteratre over the keys because
  # we are dealing with symbol keys on one side, and string keys on the other..
  @attr_map_json = @json['attr_map']
  @attr_map_param.keys.each do |k|
   expect(@attr_map_json[k.to_s]).to eq(@attr_map_param[k])
  end
  
  @pagination_json = @json['pagination']
  @pagination_param.keys.each do |k|
    expect(@pagination_json[k.to_s]).to eq(@pagination_param[k])
  end

end



