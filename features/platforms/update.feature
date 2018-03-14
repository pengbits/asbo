Feature: Update a Platform
   In order to make changes to the platform
   As a User
   I want to update a platform

   @http @update @put @platform
   Scenario: update a platform succesfully
     Given these platforms
       And these changes
      When I make a PUT request to platform endpoint
      Then I should get a valid response containing the platform
       And the platform in the response should reflect the changes
