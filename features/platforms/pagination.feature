Feature: Support pagination 
As a User
In order to access older episodes
I want to include a ?page parameter in the request

@pagination @param
Scenario: nts pagination
  Given the platform 'nts'
  When I call refresh with a page parameter
  Then the platform should have the correct episodes

@pagination @routes
Scenario: pagination routes
  Given the platform 'nts'
  When I visit '/platforms/nts/refresh.json?page=1'
  And  I visit '/platforms/nts/refresh.json?page=3'
  Then each response should contain different episodes

@pagination @param
Scenario: radar pagination
  Given the platform 'radar'
  When I call refresh with a page parameter
  Then the platform should have the correct episodes

@pagination @routes
Scenario: pagination routes
  Given the platform 'radar'
  When I visit '/platforms/radar/refresh.json?page=1'
  And  I visit '/platforms/radar/refresh.json?page=3'
  Then each response should contain different episodes

@pagination @param
Scenario: rinse pagination
  Given the platform 'rinse'
  When I call refresh with a page parameter
  Then the platform should have the correct episodes

@pagination @routes
Scenario: pagination routes
  Given the platform 'rinse'
  When I visit '/platforms/rinse/refresh.json?page=1'
  And  I visit '/platforms/rinse/refresh.json?page=3'
  Then each response should contain different episodes