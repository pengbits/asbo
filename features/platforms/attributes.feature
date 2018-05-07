Feature: Store scraping rules in platform
  In order to avoid writing redundant selector/scraper code in each platform
  I want to abstract the rules into an attribute map
  And share the implementation across different platforms

  @attr
  Scenario: Parse NTS.live 
    When I call create_episodes_from_html on platform 1
    Then I should get an episode with these attributes
      """
      {
        "platform_id" : 1,
        "name":"Murlo 31.01.18 Radio Episode",
        "media":{"type":"mixcloud", "url":"https://www.mixcloud.com/NTSRadio/murlo-31st-february-2018/"},
        "image":"https://media.ntslive.co.uk/resize/800x800/24463c4a-6d6d-48d7-9026-62c9af3b996f_1456963200.jpeg",
        "date": "2018-01-31"
      }
      """

  @attr
  Scenario: Parse rinse.fm
    When I call create_episodes_from_html on platform 2
    Then I should get an episode with these attributes
      """
      {
        "platform_id":2,
        "name":"Swamp 81 with Loefah \u0026 Piezo",
        "media":{"type":"soundcloud", "url":"https://soundcloud.com/rinsefm/horsemeatdisco040218swamp81"},
        "image":"http://rinse.fm/wp-content/uploads/2012/09/133_loefah_chunky_2.png",
        "date":"2018-02-04"
       }
      """