Feature: View an Episode
   In order to examine episode details
   I want to view an episode
   
  @episode @http @get
  Scenario: fetch a episode succesfully
    Given some episodes in the db
    When I load the episode endpoint '/episodes/1512'
    Then the response should be a JSON representation of the episode
    
  @episode @http @get
  Scenario: fetch a episode unsuccesfully
    Given some episodes in the db
    When I load the episode endpoint '/episodes/1'
    Then the response should be an error
      