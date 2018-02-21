Feature: Support pagination 
As a User
In order to access older episodes
I want to include a ?page parameter in the request

Background:
  Given a platform with pagination rules
  """
  {
    "id": "2",
    "name": "rinse.fm",
    "key": "rinse",
    "url"  : "http://rinse.fm/podcasts",
    "date_format" : "%Y-%m-%d",
    "attr_map" : {
      "item" : ".podcast-list-item",
      "name" : "h3",
      "image": ".listen.soundcloud a[data-img=src]",
      "url"  : ".listen.soundcloud a[href]",
      "date_str" : ".listen.soundcloud a[data-air-day]"
    },
    "pagination": {
      "param" : "page",
      "itemsPerPage" : 60
    }
  }
  """  
  
@pagination @param
Scenario: nts pagination
  When I call refresh with a page parameter
  Then the platform should have the correct episodes

  
@pagination @routes
Scenario: pagination routes
  When I visit '/platforms/rinse/refresh.json?page=1'
  And  I visit '/platforms/rinse/refresh.json?page=3'
  Then each response should contain different episodes