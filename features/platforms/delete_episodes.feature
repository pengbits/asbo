Feature: Delete Episodes for Platform
  As a User
  In order to clean up the ui
  I want to delete all of a platform's episodes
  
  @http @platform @delete @episode
  Scenario: Delete a platform's episodes
    Given these platforms
    And some episodes in the db
    When I make a DELETE request to the platform's episodes endpoint
    Then the platform in the response should not contain any episodes