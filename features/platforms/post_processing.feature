Feature: Post Processing Hooks
As a developer
In order to edit some properties of the episode  
I want to perform post-processing on the episode after it is created

  @platform @post-processing
  Scenario: Add post-processing rule to platform
    Given a platform with valid attributes
    When I set these post-processing rules
    """
    [{"name":"image","replace":["100x100","800x800"]}]
    """
     And I save it
    Then I should see the new platform in the list
     And It should have the post-processing rule