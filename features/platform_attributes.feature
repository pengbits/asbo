Feature: Store scraping rules in platform
  In order to avoid writing redundant selector/scraper code in each platform
  I want to abstract the rules into an attribute map
  And share the implementation across different platforms

  Background:
    Given these attribute maps for the platforms
    """
    [{
      "id": "1",
      "name": "nts.live",
      "key"  : "nts",
      "url"  : "https://www.nts.live/recently-added",
      "date_format" : "%d.%m.%y",
      "attr_map" : {
        "item" : ".nts-grid-item",
        "name" : ".nts-grid-item__img img[alt]",
        "image": ".nts-grid-item__img img[src]",
        "url"  : ".nts-grid-item__img__play-btn[data-src]",
        "date_str" : ".nts-grid-item__subtitle__left"
      }
    },{
      "id": "2",
      "name": "rinse.fm",
      "key" : "rinse",
      "url"  : "http://rinse.fm/podcasts",
      "date_format" : "%Y-%m-%d",
      "attr_map" : {
        "item" : ".podcast-list-item",
        "name" : "h3",
        "image": ".listen.soundcloud a[data-img=src]",
        "url"  : ".listen.soundcloud a[href]",
        "date_str" : ".listen.soundcloud a[data-air-day]"
      },{
        "id": "3",
        "name": "radar radio",
        "key" : "radar",
        "url"  : "http://www.radarradio.com/podcasts",
        "date_format" : "%e %b", # 14th Feb
        "attr_map" : {
          "item"      : ".latestarticle.radarradio_podcasts",
          "name"      : "h2",
          "image"     : "img[src]",
          "url"       : ".radarradio_podcasts_listen_button a[href]",
          "date_str"  : "h2"
        }
      }
    }]
    """
    
    And this html for each
    """
    <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/24463c4a-6d6d-48d7-9026-62c9af3b996f_1456963200.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/24463c4a-6d6d-48d7-9026-62c9af3b996f_1456963200.jpeg" alt="Murlo 31.01.18 Radio Episode"
          class="img preload-img">
        <div class="nts-grid-item__img__overlay">
          <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/murlo-31st-february-2018/" data-permalink="/shows/murlo/episodes/murlo-31st-january-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
          </div>
        </div>
      </div>
      <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/murlo/episodes/murlo-31st-january-2018"><img src="https://media.ntslive.co.uk/resize/800x800/24463c4a-6d6d-48d7-9026-62c9af3b996f_1456963200.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/24463c4a-6d6d-48d7-9026-62c9af3b996f_1456963200.jpeg" alt="Murlo 31.01.18 Radio Episode"
          class="img preload-img"></div>
      <a href="/shows/murlo/episodes/murlo-31st-january-2018" class="nts-app nts-link nts-link--nohover">
        <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
          <div class="nts-grid-item__title">Murlo</div>
          <div class="nts-grid-item__subtitle">
            <p class="nts-grid-item__subtitle__left">31.01.18</p>
            <p class="nts-grid-item__subtitle__right">LDN</p>
          </div>
        </div>
      </a>
      <div class="nts-grid-item__footer">
        <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="caribbean-dancehall" href="/explore/genre/caribbean-dancehall">Dancehall</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
            data-tag-id="ukdance-ukgarage" href="/explore/genre/ukdance-ukgarage">Garage</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="ukdance-grime" href="/explore/genre/ukdance-grime">Grime</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
            data-tag-id="caribbean-soca" href="/explore/genre/caribbean-soca">Soca</a> </div>
        <div class="nts-grid-item__action-btns">
          <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/murlo-31st-february-2018/" data-permalink="/shows/murlo/episodes/murlo-31st-january-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/murlo/episodes/murlo-31st-january-2018">TRACKLIST</a></div>
      </div>
    </div>
    _BREAK_
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
    _BREAK_
    <article class="latestarticle radarradio_podcasts">
    	<header class="latestheader">
    		<span><a href="/podcasts/night-slugs-w-girl-unit-bok-bok-hardbody-special-13th-feb"><img width="2000" height="2000" src="/wp-content/uploads/2018/02/Nightslugs-Feb.jpg" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="" srcset="/wp-content/uploads/2018/02/Nightslugs-Feb.jpg 2000w, /wp-content/uploads/2018/02/Nightslugs-Feb-150x150.jpg 150w, /wp-content/uploads/2018/02/Nightslugs-Feb-300x300.jpg 300w, /wp-content/uploads/2018/02/Nightslugs-Feb-768x768.jpg 768w, /wp-content/uploads/2018/02/Nightslugs-Feb-1024x1024.jpg 1024w" sizes="(max-width: 2000px) 100vw, 2000px"></a></span>
    	</header>
    	<section class="latestcontent">
    		<h2><a href="/podcasts/night-slugs-w-girl-unit-bok-bok-hardbody-special-13th-feb">Night Slugs w/ Girl Unit &amp; Bok Bok (Hardbody Special) – 13th Feb</a></h2>
    		<p>
    		</p>
    		<div class="radarradio_podcasts_listen_button"><a href="/podcasts/night-slugs-w-girl-unit-bok-bok-hardbody-special-13th-feb" title="Listen">Listen</a></div>
    		<p></p>
    	</section>
    </article>
    """

  @attr
  Scenario: Parse NTS.live 
    When I call create_episodes_from_html on platform 1
    Then I should get an episode with these attributes
      """
      {
        "platform_id" : 1,
        "name":"Murlo 31.01.18 Radio Episode",
        "image":"https://media.ntslive.co.uk/resize/800x800/24463c4a-6d6d-48d7-9026-62c9af3b996f_1456963200.jpeg",
        "date": "2018-01-31",
        "url":"https://www.mixcloud.com/NTSRadio/murlo-31st-february-2018/"
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
        "url":"https://soundcloud.com/rinsefm/horsemeatdisco040218swamp81",
        "image":"",
        "date":"2018-02-04"
       }
      """
  
  @attr @radar
  Scenario: Parse radarradio
    When I call create_episodes_from_html on platform 3
    Then I should get an episode with these attributes
      """
      {
        "platform_id":3
        "name":"Kamillah Rose w/ Dobby – 14th Feb",
        "img":"/wp-content/uploads/2018/02/Kam-14th-Feb1-1.jpg",
        "url":"/podcasts/kamillah-rose-w-dobby-14th-feb",
        "date_str":"Kamillah Rose w/ Dobby – 14th Feb"
      }
      """