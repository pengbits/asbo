Feature: Add a Platform
   In order to have access to more podcasts 
   As a User
   I want to add a platform
   
   Background:
     Given these attributes 
     """
     {
       "name": "nts.live",
       "key":"nts",
       "url"  : "https://www.nts.live/recently-added",
       "attr_map" : {
         "item" : ".nts-grid-item",
         "name" : ".nts-grid-item__img img[alt]",
         "image": ".nts-grid-item__img img[src]",
         "url"  : ".nts-grid-item__img__play-btn[data-src]",
         "date_str" : ".nts-grid-item__subtitle__left"
       }
     }
     """
     
  @platform @model
  Scenario: Add a Platform via console
    When I save it
    Then I should see the new platform in the list

  @platform @http @post
  Scenario: Add a Platform via POST
    When I make a POST request to platforms endpoint with valid JSON
    """
    {
      "name" : "Radar Radio",
      "key" : "radar",
      "url" : "http://www.radarradio.com/podcasts"
    }
    """
    Then I should see the new platform in the list
      