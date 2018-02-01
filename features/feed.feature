Feature: View Feed
   In order to reduce a large collection of radio episodes (on a third party platform) to a manageable list
   I want to view them in list, filtered by a phrase or keyword
   
   
Scenario: nts.live feed
  Given a platform with the nickname rinse.fm
   When I view the feed
   Then I should get one or more episodes of shows on nts