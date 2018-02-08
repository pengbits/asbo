Feature: Handle Dates
  As a Platform
  I want to parse date strings in custom format
  And then convert them to date objects
  In order to sort episodes chronologically
  
  @date
  Scenario: Parse dates
    Given this the date '07.02.18'
    And the date format %d.%m.%y
    When I set the date for the episode
    Then the date_proper will be correct
    