Feature: View a Platform
   In order to examine platform details
   I want to view a platform
   
  @platform @http @get
  Scenario: fetch a platform succesfully
    Given these platforms
    When I load the platform endpoint '/platforms/rinse'
    Then the response should be a JSON representation of the platform
    
  @platform @http @get
  Scenario: fetch a platform unsuccesfully
    Given these platforms
    When I load the platform endpoint '/platforms/foo'
    Then the response should be an error
      