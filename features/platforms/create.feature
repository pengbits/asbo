Feature: Add a Platform
   In order to have access to more podcasts 
   As a User
   I want to add a platform
   
   Background:
     Given a platform with valid attributes
     
  @platform @model
  Scenario: Add a Platform via console
    When I save it
    Then I should see the new platform in the list

  @platform @http @post
  Scenario: Add a Platform via POST
    When I make a POST request to platforms endpoint with valid JSON
    """
    {
      "platform" : {
        "name" : "Radar Radio",
        "key" : "radar",
        "url" : "http://www.radarradio.com/podcasts"
      }
    }
    """
    Then I should get a valid response containing the platform
      