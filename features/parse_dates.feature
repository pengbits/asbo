Feature: Handle Dates
  As a Platform
  I want to parse date strings in custom format
  And then convert them to date objects
  In order to sort episodes chronologically
  
  @date
  Scenario: Parse dates
    Given this date '07.02.18'
    And this date format '%d.%m.%y'
    When I set the date_str for the episode
    Then the date will be correct
    