Feature: Combine episodes from different Platforms 
  As a User
  In order to get more episodes from the same artist or show
  I want to combine episodes from different Platforms
  
  Scenario: combine episodes from multiple platforms and sort by date
    Given these platforms
    """
    [{
      "id": "1",
      "name": "nts.live",
      "url"  : "https://www.nts.live/recently-added",
      "attr_map" : {
        "item" : ".nts-grid-item",
        "name" : ".nts-grid-item__img img[alt]",
        "image": ".nts-grid-item__img img[src]",
        "url"  : ".nts-grid-item__img__play-btn[data-src]",
        "date" : ".nts-grid-item__subtitle__left"
      }
    },{
      "id": "2",
      "name": "rinse.fm",
      "url"  : "http://rinse.fm/podcasts",
      "attr_map" : {
        "item" : ".podcast-list-item",
        "name" : "h3",
        "image": ".listen.soundcloud a[data-img=src]",
        "url"  : ".listen.soundcloud a[href]",
        "date" : ".listen.soundcloud a[data-air-day]"
      }
    }]
    """
    
    And these episodes
    
    