Feature: Default Image
As a developer
In order to render an image for the episode even when it's not available
I want to define a default image on the platform
    
    Background:
      Given a platform with valid attributes
      
    @platform @model @images
    Scenario: Add default image
      When I set a default image 
       And I save it
      Then I should see the new platform in the list 
       And I should see the default image in the platform
