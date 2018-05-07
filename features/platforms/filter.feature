Feature: Filter Platform's Episodes
   In order to reduce a large collection of podcast episodes on an external platform (in html format)
   to a manageable list suitable for consumption by a local app (in JSON format)
   I want to reduce them to a subset and coerce into JSON/RSS

@filter @platform @http
Scenario: filter a platform's episodes by a search term
  Given these platforms
    And some episodes in the db
    And using a filter parameter 'Sound'
   When I load the platform endpoint 
   """
   {"nickname": "rinse"}
   """
   Then the response should be a JSON representation of the platform
    And the response should include some episodes with the search term in their name