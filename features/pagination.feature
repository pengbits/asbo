Feature: Support pagination 
As a User
In order to access older episodes
I want to include a ?page parameter in the request

@pagination
Scenario: nts pagination
  Given a platform with pagination rules
  """
  {
    "id": "2",
    "name": "rinse.fm",
    "url"  : "http://rinse.fm/podcasts?foo=true",
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
  When I call refresh with a page parameter
  Then the platform should have the correct episodes