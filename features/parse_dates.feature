Feature: Handle Dates
  As a Platform
  I want to parse date strings in custom format
  And then convert them to date objects
  In order to sort episodes chronologically
  
  @date
  Scenario: Parse dates for NTS
    Given this date '07.02.18'
    And this date format '%d.%m.%y'
    When I set the date_str for the episode
    Then episode.date.to_s will be '2018-02-07'
  
  @date
  Scenario: Parse dates for Radar
    Given this date 'Feb 13'
    And this implicit year '2018'
    And this date format '%b %e'
    When I set the date_str for the episode
    Then episode.date.to_s will be '2018-02-13'
  