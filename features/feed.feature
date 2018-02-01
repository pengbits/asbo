Feature: View Feed
   In order to reduce a large collection of episodes to a manageable list
   I want to view a subset of them
   

   Scenario: With a valid platform
     Given the following platforms:
        |name|key|
        |nts.live|nts|
        |rinse.fm|rinse|
        |radarradio|radar|
      When I load the platform endpoint with key: "nts"
      Then The response should be a JSON representation of the platform
           
  Scenario: get latest episodes for a platform
    Given a platform with episodes
     When I view the platform's feed 
     Then I should get a list of episodes