module PlatformData
  def self.sample_attributes
    [{
      id: "1",
      name: "nts.live",
      nickname: "nts",
      url: "https://www.nts.live/recently-added",
      date_format: "%d.%m.%y",
      has_details: true,
      use_relative_images: false,
      attr_map: {
        "item"      => ".nts-grid-v2-item",
        "name"      => ".nts-grid-picture__img[alt]",
        "image"     => ".nts-grid-picture__img[src]",
        "media"     => ".nts-grid-picture__overlay.mixcloud-btn[data-src]",
        "date_str"  => ".nts-grid-v2-item__header span:first-child",
        "details"   => ".nts-grid-picture__overlay.mixcloud-btn[data-permalink]"
      },
      pagination: {    
        "route"        => "/page/:page",
        "itemsPerPage" => 12
      },
      post_processing_rules: [{
        "name" => "image",
        "gsub" => ["100x100","800x800"]
      }]
    },{
      id: "2",
      name: "rinse.fm",
      nickname: "rinse",
      url: "http://rinse.fm/podcasts",
      date_format: "%Y-%m-%d",
      has_details: false,
      use_relative_images: false,
      default_image: "https://etc.levels.io/rinse-fm/logo.png",
      attr_map: {
        "item"      => ".podcast-list-item",
        "name"      => "h3",
        "image"     => ".listen.soundcloud a[data-img-src]",
        "media"     => ".listen.soundcloud a[href]",
        "date_str"  => ".listen.soundcloud a[data-air-day]"
      },
      pagination: {    
        "param"        => "page",
        "itemsPerPage" => 60
      }
    },{
      id: "3",
      name: "radar radio",
      nickname: "radar",
      url: "https://www.radarradio.com/podcasts",
      date_format: "%e %b",
      has_details: true,
      use_relative_images: true,
      attr_map: {
        "item"      => ".latestarticle.radarradio_podcasts",
        "name"      => "h2[split(' – ',0)]",
        "image"     => "img[src]",
        "details"   => ".radarradio_podcasts_listen_button a[href]",
        "date_str"  => "h2[split(' – ',1)]"
      },
      pagination: {
        "url" => "http://www.radarradio.com/wp-admin/admin-ajax.php?action=alm_query_posts&post_type=radarradio_podcasts&posts_per_page=32",
        "param" => "pageNumber",
        "itemsPerPage" => 32
      }
    }]
  end
  
  def self.sample_html_entries
    <<-END
    <article class="nts-grid-v2-item ">
      <div class="nts-grid-v2-item__content">
        <div class="nts-grid-picture"><img class="nts-grid-picture__img" src="https://media.ntslive.co.uk/resize/400x400/24463c4a-6d6d-48d7-9026-62c9af3b996f_1456963200.jpeg" alt="Murlo 18.07.18 Radio Episode">
          <div role="button" tabindex="0" class="nts-grid-picture__overlay mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/murlo-18th-july-2018/" data-permalink="/shows/murlo/episodes/murlo-18th-july-2018" data-event-label=""><svg
              class="nts-icon nts-icon--l nts-icon--overlay" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 600">
              <title>Play</title>
            </svg></div>
        </div><a class="nts-grid-v2-item__header nts-app" href="/shows/murlo/episodes/murlo-18th-july-2018"><span>18.07.18</span><span>LDN</span>
          <div class="nts-grid-v2-item__header__title">Murlo</div>
        </a>
        <div class="nts-grid-v2-item__footer"><a class="nts-tag nts-app" data-tag-id="newclub-reggaeton" href="/explore/genre/newclub-reggaeton">Reggaeton</a><a class="nts-tag nts-app" data-tag-id="caribbean-bashment"
            href="/explore/genre/caribbean-bashment">Bashment</a><a class="nts-tag nts-app" data-tag-id="caribbean-dancehall" href="/explore/genre/caribbean-dancehall">Dancehall</a><a class="nts-tag nts-app" data-tag-id="ukdance-grime"
            href="/explore/genre/ukdance-grime">Grime</a></div>
      </div><a class="nts-grid-v2-item__extra nts-app nts-link" href="/shows/murlo/episodes/murlo-18th-july-2018">Tracklist</a>
    </article>
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
    END
    .split("_BREAK_")
  end
end