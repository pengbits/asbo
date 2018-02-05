Feature: Store scraping rules in platform
   In order to avoid writing redundant selector/scraper code in each platform
   I want to abstract the rules into an attribute map
   And share the implementation across different platforms
  
   Scenario: NTS and Rinse have different markup, same content model
     Given this attribute map for the platform
      """
        "id": "1",
        "name": "nts.live",
        "attribute_map": {
          "name" : ".nts-grid-item__img img[alt]",
          "image": ".nts-grid-item__img img[src]",
          "url"  : ".nts-grid-item__img__play-btn[data-src]",
          "date" : ".nts-grid-item__subtitle__left"
        }
      """
      