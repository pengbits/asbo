Feature: View Feed
   In order to reduce a large collection of podcast episodes on an external platform (in html format)
   to a manageable list suitable for consumption by a local app (in JSON format)
   I want to reduce them to a subset and coerce into JSON/RSS
  
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
     When I view the platform's episodes property
     Then there should be some episodes
  
  @filter
  Scenario: filter episodes by a search term
    Given a platform
      And episodes
      And a search term: 'murlo'
     When I view the platform's episodes property with a filter
     Then it should only include episodes with 'murlo' in their name