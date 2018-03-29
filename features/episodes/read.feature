Feature: View an Episode
   In order to examine episode details
   I want to view an episode
  
   Background:
    Given these platforms
      And some episodes in the db
    
  @episode @http @get
  Scenario: fetch a episode succesfully
     When I load the episode endpoint with a good id
     Then the response should be a JSON representation of the episode
    
  @episode @http @get
  Scenario: fetch a episode unsuccesfully
     When  I load the episode endpoint with a bad id
     Then the response should be an episode not found error
      