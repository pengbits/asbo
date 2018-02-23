Feature: Support pagination 
As a User
In order to access older episodes
I want to include a ?page parameter in the request

Background:
  Given a platform with pagination rules
  """
  {
    "id"       : 3,
    "name"     : "radar radio",
    "key"      : "radar",
    "attr_map" : {
      "item"      : ".latestarticle.radarradio_podcasts",
      "name"      : "h2[split(' – ',0)]",
      "image"     : "img[src]",
      "url"       : ".radarradio_podcasts_listen_button a[href]",
      "date_str"  : "h2[split(' – ',1)]"
    },
    "url"         : "http://www.radarradio.com/podcasts",
    "date_format" : "%e %b",
    "pagination"  : {
      "url"           : "http://www.radarradio.com/wp-admin/admin-ajax.php?action=alm_query_posts&post_type=radarradio_podcasts&posts_per_page=16",
      "itemsPerPage"  : 16,
      "param"         : "pageNumber"
    }
  }
  """  

@pagination @param
Scenario: radar pagination
  When I call refresh with a page parameter
  Then the platform should have the correct episodes

@pagination @routes
Scenario: pagination routes
  When I visit '/platforms/radar/refresh.json?page=1'
  And  I visit '/platforms/radar/refresh.json?page=3'
  Then each response should contain different episodes