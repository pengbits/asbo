Feature: Display Feed
   In order to view episodes of a podcast
   I want to display a feed
   
Scenario: using valid data
  Given a feed with an id "1"
  When the client makes a GET /feeds request