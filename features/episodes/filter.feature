Feature: Filter Episodes
   In order to reduce a large collection of podcast episodes on an external platform (in html format)
   to a manageable list suitable for consumption by a local app (in JSON format)
   I want to reduce them to a subset and coerce into JSON/RSS

@filter @episode @http
Scenario: filter all episodes by a search term
  Given these platforms
    And some episodes in the db
    And using a filter parameter 'Sound'
   When I load the episodes endpoint
   Then the response should include some episodes with the search term in their name
   
   