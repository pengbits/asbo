Feature: Store scraping rules in platform
  In order to avoid writing redundant selector/scraper code in each platform
  I want to abstract the rules into an attribute map
  And share the implementation across different platforms

  @attr
  Scenario: Parse Rinse.fm markup
    Given this attribute map for the platform
      """
      {
        "id": "2",
        "name": "rinse.fm",
        "attribute_map" : {
          "item" : ".podcast-list-item",
          "name" : "h3",
          "image": ".listen.soundcloud a[data-img=src]",
          "url"  : ".listen.soundcloud a[href]",
          "date" : ".listen.soundcloud a[data-air-day]"
        }
      }
      """
    And this html
      """
      <div class="borderbottom left podcast-list-item" id="swamp81040218">
        <div class="left w8-16">
          <h3 class="darkgrey tstarheavyupper px15 mb8">Swamp 81 with Loefah &amp; Piezo </h3>
          <div class="listen icon soundcloud">
            <a href="https://soundcloud.com/rinsefm/horsemeatdisco040218swamp81" nclick="__gaTracker('send', 'event', 'openpodcastinplayer', 'soundcloud_podcastpage', 'Podcast: Swamp 81 with Loefah &amp; Piezo');" class="bgsoundcloudorange soundcloud-link" data-airtime="17"
              data-air-day="2018-02-04" data-artist="Swamp 81 with Loefah &amp; Piezo" data-img-src="http://rinse.fm/wp-content/uploads/2012/09/133_loefah_chunky_2.png">&nbsp;</a>
            <a href="http://podcast.dgen.net/rinsefm/podcast/Swamp81040218.mp3" class="bglightblue alt-link" style="display:none" data-airtime="17" data-air-day="2018-02-04" data-artist="Swamp 81 with Loefah &amp; Piezo" data-img-src="http://rinse.fm/wp-content/uploads/2012/09/133_loefah_chunky_2.png">&nbsp;</a>
          </div>
          <div class="listen icon">
            <a href="http://podcast.dgen.net/rinsefm/podcast/Swamp81040218.mp3" class="bglightblue" onclick="__gaTracker('send', 'event', 'openpodcastinplayer', 'podcastpage', 'Podcast: Swamp 81 with Loefah &amp; Piezo');" data-airtime="17" data-air-day="2018-02-04"
              data-artist="Swamp 81 with Loefah &amp; Piezo" data-img-src="http://rinse.fm/wp-content/uploads/2012/09/133_loefah_chunky_2.png">&nbsp;</a>
          </div>
          <div class="download icon">
            <a href="http://podcast.dgen.net/rinsefm/podcast/Swamp81040218.mp3" download="http://podcast.dgen.net/rinsefm/podcast/Swamp81040218.mp3" target="_blank" class="bglavender" title="Right Click and Save As to Download">&nbsp;</a>
          </div>
        </div>
        <!-- snip -->
      </div>
      """
    When I call create_episodes_from_html on the platform
    Then I should get an episode with these attributes
       """
       {
         "name":"Swamp 81 with Loefah \u0026 Piezo ",
         "platform_id":2,
         "url":"https://soundcloud.com/rinsefm/horsemeatdisco040218swamp81",
         "image":"",
         "date":"2018-02-04"
        }
       """