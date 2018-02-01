Feature: View Feed
   In order to reduce a large collection of radio episodes (on a third party platform) to a managable list
   I want to view them in list, filtered by a phrase or keyword
   
   
Scenario: nts.live feed with filter murlo
  Given the platform nts
    And the tag murlo
   When I view the feed
   Then I should get one or more episodes of a show on nts with murlo in it's name