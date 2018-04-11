Feature: Support pagination 
As a User
In order to access older episodes
I want to include a ?page parameter in the request

@pagination @param
Scenario Outline: pagination
  Given the platform nickname=<nickname>
  When I call refresh with a page parameter
  Then the platform should have the correct episodes
  
  Examples:
    |nickname|
    |nts|
    |rinse|
    |radar|

@pagination @routes
Scenario Outline: pagination routes
  Given the platform nickname=<nickname>
  When I visit '/platforms/<nickname>/refresh?page=1'
  And  I visit '/platforms/<nickname>/refresh?page=3'
  Then each response should contain different episodes
  
  Examples:
    |nickname|
    |nts|
    |rinse|
    |radar|
