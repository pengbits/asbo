Feature: Delete a Platform
   In order to keep listof platforms manageable
   I want to delete a platform
   
  @platform @http @delete
  Scenario: delete a platform succesfully
    Given these platforms
    When I make a DELETE request to platform endpoint
    Then the response should be success
    