
Given(/^a platform with the nickname (.+)$/) do |key|
  puts "get platform #{key}"
  FactoryBot.create(:platform, key: name)
end

Given("the tag murlo") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I view the feed") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should get one or more episodes of a show on nts with murlo in it's name") do
  pending # Write code here that turns the phrase above into concrete actions
end

