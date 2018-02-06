Feature: Refresh Platform
  In order to get the latest episodes
  As a User
  I want to refresh the Platform by connecting to the remote host
  And scraping the latest episodes page
  
  @http
  Scenario: Refresh NTS.live
    Given a Platform with these attributes
    """
    {
      "name" : "NTS live",
      "url"  : "https://www.nts.live/recently-added",
      "attr_map" : {
        "item" : ".nts-grid-item",
        "name" : ".nts-grid-item__img img[alt]",
        "image": ".nts-grid-item__img img[src]",
        "url"  : ".nts-grid-item__img__play-btn[data-src]",
        "date" : ".nts-grid-item__subtitle__left"
      }
    }
    """
    
    When I refresh the Platform
    Then the episodes list should contain new episodes
