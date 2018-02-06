Feature: Add a Platform
   In order to have access to more podcasts 
   As a User
   I want to add a platform
   
   @platform @model
   Scenario: Add a Platform successfully
     Given these attributes 
     """
     {
       "name": "nts.live",
       "key":"nts",
       "attribute_map" : {
         "item" : ".nts-grid-item",
         "name" : ".nts-grid-item__img img[alt]",
         "image": ".nts-grid-item__img img[src]",
         "url"  : ".nts-grid-item__img__play-btn[data-src]",
         "date" : ".nts-grid-item__subtitle__left"
       }
     }
     """
     When I save it
     Then I should see the new platform in the list