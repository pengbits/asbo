Feature: Support pagination 
As a User
In order to access older episodes
I want to include a ?page parameter in the request

@pagination
Scenario: nts pagination
  Given a plaform with pagination rules
  """
  {
    "id": "1",
    "name": "nts.live",
    "url"  : "https://www.nts.live/recently-added",
    "date_format" : "%d.%m.%y",
    "attr_map" : {
      "item" : ".nts-grid-item",
      "name" : ".nts-grid-item__img img[alt]",
      "image": ".nts-grid-item__img img[src]",
      "url"  : ".nts-grid-item__img__play-btn[data-src]",
      "date_str" : ".nts-grid-item__subtitle__left"
    },
    "pagination":{
      "url" : ":base_ur/page/:page",
      "itemsPerPage" : 12
    }
  """  
  When I call refresh with a page parameter
  Then the platform should have the correct episodes