Feature: Refresh Platform
  In order to get the latest episodes
  As a User
  I want to refresh the Platform by connecting to the remote host
  And scraping the latest episodes page
  
  Background: 
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
    
    And this document html 
    """
    <div class="nts-grid clearfix">
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/281ca8dc-fcb1-4761-919e-b36b9f87f964_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/281ca8dc-fcb1-4761-919e-b36b9f87f964_1517875200.jpeg" alt="Torn Hawk 06.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/torn-hawk-6th-february-2018/" data-permalink="/shows/torn-hawk/episodes/torn-hawk-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/torn-hawk/episodes/torn-hawk-6th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/281ca8dc-fcb1-4761-919e-b36b9f87f964_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/281ca8dc-fcb1-4761-919e-b36b9f87f964_1517875200.jpeg" alt="Torn Hawk 06.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/torn-hawk/episodes/torn-hawk-6th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Torn Hawk</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">06.02.18</p>
                <p class="nts-grid-item__subtitle__right">NYC</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="avantgarde-experimental" href="/explore/genre/avantgarde-experimental">Experimental</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="ambientnewage-ambient" href="/explore/genre/ambientnewage-ambient">Ambient</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="genres-genres-genres-genres-genres-genres-genres-genres-genres-rock-soft-rock"
                href="/explore/genre/genres-genres-genres-genres-genres-genres-genres-genres-genres-rock-soft-rock">Soft Rock</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/torn-hawk-6th-february-2018/" data-permalink="/shows/torn-hawk/episodes/torn-hawk-6th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/torn-hawk/episodes/torn-hawk-6th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/dd01d7d2-34d6-48a3-8b13-f8a41f9fea57_1459119600.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/dd01d7d2-34d6-48a3-8b13-f8a41f9fea57_1459119600.jpeg" alt="All Fruits Ripe w/ Jack Sapsed 05.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/all-fruits-ripe-w-jack-sapsed-5th-february-2018/" data-permalink="/shows/all-fruits-ripe/episodes/all-fruits-ripe-w-jack-sapsed-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/all-fruits-ripe/episodes/all-fruits-ripe-w-jack-sapsed-5th-february-2018"><img src="https://media.ntslive.co.uk/resize/800x800/dd01d7d2-34d6-48a3-8b13-f8a41f9fea57_1459119600.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/dd01d7d2-34d6-48a3-8b13-f8a41f9fea57_1459119600.jpeg" alt="All Fruits Ripe w/ Jack Sapsed 05.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/all-fruits-ripe/episodes/all-fruits-ripe-w-jack-sapsed-5th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">All Fruits Ripe w/ Jack Sapsed</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">05.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="caribbean-dub" href="/explore/genre/caribbean-dub">Dub</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="ukdance-jungle"
                href="/explore/genre/ukdance-jungle">Jungle</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/all-fruits-ripe-w-jack-sapsed-5th-february-2018/" data-permalink="/shows/all-fruits-ripe/episodes/all-fruits-ripe-w-jack-sapsed-5th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/all-fruits-ripe/episodes/all-fruits-ripe-w-jack-sapsed-5th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/54c36fcf-8bd1-44c4-8c8f-73ec1d5b1029_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/54c36fcf-8bd1-44c4-8c8f-73ec1d5b1029_1517875200.jpeg" alt="The Synth Hero Show w/ Stephen Morris 05.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/the-synth-hero-show-w-stephen-morris-5th-february-2018/" data-permalink="/shows/synth-hero-show/episodes/the-synth-hero-show-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/synth-hero-show/episodes/the-synth-hero-show-5th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/54c36fcf-8bd1-44c4-8c8f-73ec1d5b1029_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/54c36fcf-8bd1-44c4-8c8f-73ec1d5b1029_1517875200.jpeg" alt="The Synth Hero Show w/ Stephen Morris 05.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/synth-hero-show/episodes/the-synth-hero-show-5th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">The Synth Hero Show w/ Stephen Morris</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">05.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="postpunkwave-postpunk" href="/explore/genre/postpunkwave-postpunk">Post Punk</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="rock-krautrock" href="/explore/genre/rock-krautrock">Krautrock</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="ambientnewage-kosmiche" href="/explore/genre/ambientnewage-kosmiche">Kosmische</a>          </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/the-synth-hero-show-w-stephen-morris-5th-february-2018/" data-permalink="/shows/synth-hero-show/episodes/the-synth-hero-show-5th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/synth-hero-show/episodes/the-synth-hero-show-5th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/fd32faeb-17d8-445c-8b94-3534fa209aec_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/fd32faeb-17d8-445c-8b94-3534fa209aec_1517875200.jpeg" alt="CDMX Tapes w/ NKC &amp; Fausto Bahía 05.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/cdmx-tapes-5th-february-2018/" data-permalink="/shows/naafi/episodes/cdmx-tapes-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/naafi/episodes/cdmx-tapes-5th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/fd32faeb-17d8-445c-8b94-3534fa209aec_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/fd32faeb-17d8-445c-8b94-3534fa209aec_1517875200.jpeg" alt="CDMX Tapes w/ NKC &amp; Fausto Bahía 05.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/naafi/episodes/cdmx-tapes-5th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">CDMX Tapes w/ NKC &amp; Fausto Bahía</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">05.02.18</p>
                <p class="nts-grid-item__subtitle__right">MEX</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="newclub-club" href="/explore/genre/newclub-club">Club</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="newclub-reggaeton"
                href="/explore/genre/newclub-reggaeton">Reggaeton</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="newclub-batida" href="/explore/genre/newclub-batida">Batida</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="newclub-baile-funk" href="/explore/genre/newclub-baile-funk">Baile Funk</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/cdmx-tapes-5th-february-2018/" data-permalink="/shows/naafi/episodes/cdmx-tapes-5th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/naafi/episodes/cdmx-tapes-5th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/0bd67026-f9a1-4afd-9304-2198fa8add38_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/0bd67026-f9a1-4afd-9304-2198fa8add38_1517875200.jpeg" alt="Who's That Girl? - Norma Jean Bell 05.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/whos-that-girl-5th-february-2018/" data-permalink="/shows/whos-that-girl/episodes/whos-that-girl-w-leyla-pillai-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/whos-that-girl/episodes/whos-that-girl-w-leyla-pillai-5th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/0bd67026-f9a1-4afd-9304-2198fa8add38_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/0bd67026-f9a1-4afd-9304-2198fa8add38_1517875200.jpeg" alt="Who's That Girl? - Norma Jean Bell 05.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/whos-that-girl/episodes/whos-that-girl-w-leyla-pillai-5th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Who's That Girl? - Norma Jean Bell</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">05.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="housetechno-house-detroithouse" href="/explore/genre/housetechno-house-detroithouse">Detroit House</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="soulrhythm-funk" href="/explore/genre/soulrhythm-funk">Funk</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="soulrhythm-soul" href="/explore/genre/soulrhythm-soul">Soul</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/whos-that-girl-5th-february-2018/" data-permalink="/shows/whos-that-girl/episodes/whos-that-girl-w-leyla-pillai-5th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/whos-that-girl/episodes/whos-that-girl-w-leyla-pillai-5th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/7330555e-ef3b-42c5-9d4d-e31d0ace5bdf_1517443200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/7330555e-ef3b-42c5-9d4d-e31d0ace5bdf_1517443200.jpeg" alt="Vlad Dobrovolski 05.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/vlad-dobrovolski-5th-february-2018/" data-permalink="/shows/guests/episodes/vlad-dobrovolski-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/guests/episodes/vlad-dobrovolski-5th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/7330555e-ef3b-42c5-9d4d-e31d0ace5bdf_1517443200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/7330555e-ef3b-42c5-9d4d-e31d0ace5bdf_1517443200.jpeg" alt="Vlad Dobrovolski 05.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/guests/episodes/vlad-dobrovolski-5th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Vlad Dobrovolski</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">05.02.18</p>
                <p class="nts-grid-item__subtitle__right">MOS</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="ambientnewage-forthworld" href="/explore/genre/ambientnewage-forthworld">Fourth World</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="ambientnewage-ambient" href="/explore/genre/ambientnewage-ambient">Ambient</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/vlad-dobrovolski-5th-february-2018/" data-permalink="/shows/guests/episodes/vlad-dobrovolski-5th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/guests/episodes/vlad-dobrovolski-5th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/dd422a1d-30c9-42f8-be16-7eca470f19bf_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/dd422a1d-30c9-42f8-be16-7eca470f19bf_1517875200.jpeg" alt="Hit A Lick Radio 05.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/hit-a-lick-radio-5th-february-2018/" data-permalink="/shows/hit-a-lick/episodes/hit-a-lick-radio-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/hit-a-lick/episodes/hit-a-lick-radio-5th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/dd422a1d-30c9-42f8-be16-7eca470f19bf_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/dd422a1d-30c9-42f8-be16-7eca470f19bf_1517875200.jpeg" alt="Hit A Lick Radio 05.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/hit-a-lick/episodes/hit-a-lick-radio-5th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Hit A Lick Radio</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">05.02.18</p>
                <p class="nts-grid-item__subtitle__right">PHI</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="hiphoprandb-hiphop" href="/explore/genre/hiphoprandb-hiphop">Hip Hop</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="hiphoprandb-trap" href="/explore/genre/hiphoprandb-trap">Trap</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/hit-a-lick-radio-5th-february-2018/" data-permalink="/shows/hit-a-lick/episodes/hit-a-lick-radio-5th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/hit-a-lick/episodes/hit-a-lick-radio-5th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/f276d408-1b1f-4d89-88ac-90731e612368_1458000000.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/f276d408-1b1f-4d89-88ac-90731e612368_1458000000.jpeg" alt="Anthony Chalmers 05.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/anthony-chalmers-5th-february-2018/" data-permalink="/shows/anthonychalmers/episodes/anthony-chalmers-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/anthonychalmers/episodes/anthony-chalmers-5th-february-2018"><img src="https://media.ntslive.co.uk/resize/800x800/f276d408-1b1f-4d89-88ac-90731e612368_1458000000.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/f276d408-1b1f-4d89-88ac-90731e612368_1458000000.jpeg" alt="Anthony Chalmers 05.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/anthonychalmers/episodes/anthony-chalmers-5th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Anthony Chalmers</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">05.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="altrockpunk-noiserock" href="/explore/genre/altrockpunk-noiserock">Noise Rock</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="postpunkwave-postpunk" href="/explore/genre/postpunkwave-postpunk">Post Punk</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="rock-psychedelic-rock" href="/explore/genre/rock-psychedelic-rock">Psychedelic Rock</a>          </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/anthony-chalmers-5th-february-2018/" data-permalink="/shows/anthonychalmers/episodes/anthony-chalmers-5th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/anthonychalmers/episodes/anthony-chalmers-5th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/6a994899-796f-4d2f-b7d4-3a5c3411424c_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/6a994899-796f-4d2f-b7d4-3a5c3411424c_1517875200.jpeg" alt="Jason Kerley 05.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/jason-kerley-5th-february-2018/" data-permalink="/shows/joaneskyler/episodes/jason-kerley-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/joaneskyler/episodes/jason-kerley-5th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/6a994899-796f-4d2f-b7d4-3a5c3411424c_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/6a994899-796f-4d2f-b7d4-3a5c3411424c_1517875200.jpeg" alt="Jason Kerley 05.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/joaneskyler/episodes/jason-kerley-5th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Jason Kerley</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">05.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="electronicadowntempo-electronica" href="/explore/genre/electronicadowntempo-electronica">Electronica</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="electronicadowntempo-glitch" href="/explore/genre/electronicadowntempo-glitch">Glitch</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="avantgarde-musiqueconcrete" href="/explore/genre/avantgarde-musiqueconcrete">Musique Concrete</a>          </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/jason-kerley-5th-february-2018/" data-permalink="/shows/joaneskyler/episodes/jason-kerley-5th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/joaneskyler/episodes/jason-kerley-5th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/44683786-cbdd-461c-9db6-afdf7dd7fb08_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/44683786-cbdd-461c-9db6-afdf7dd7fb08_1517875200.jpeg" alt="Radio Jiro w/ Leolyxxx 05.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/radio-jiro-5th-february-2018/" data-permalink="/shows/radio-jiro/episodes/radio-jiro-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/radio-jiro/episodes/radio-jiro-5th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/44683786-cbdd-461c-9db6-afdf7dd7fb08_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/44683786-cbdd-461c-9db6-afdf7dd7fb08_1517875200.jpeg" alt="Radio Jiro w/ Leolyxxx 05.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/radio-jiro/episodes/radio-jiro-5th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Radio Jiro w/ Leolyxxx</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">05.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="discoboogie-italo" href="/explore/genre/discoboogie-italo">Italo</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="postpunkwave-synthpop" href="/explore/genre/postpunkwave-synthpop">Synth Pop</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="discoboogie-boogie" href="/explore/genre/discoboogie-boogie">Boogie</a>          <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="discoboogie-cosmicdisco" href="/explore/genre/discoboogie-cosmicdisco">Cosmic Disco</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/radio-jiro-5th-february-2018/" data-permalink="/shows/radio-jiro/episodes/radio-jiro-5th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/radio-jiro/episodes/radio-jiro-5th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/57b6f721-1d0d-4e17-8db3-e5066460de35_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/57b6f721-1d0d-4e17-8db3-e5066460de35_1517875200.jpeg" alt="Are You Before 05.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/are-you-before-5th-february-2018/" data-permalink="/shows/are-you-before/episodes/are-you-before-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/are-you-before/episodes/are-you-before-5th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/57b6f721-1d0d-4e17-8db3-e5066460de35_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/57b6f721-1d0d-4e17-8db3-e5066460de35_1517875200.jpeg" alt="Are You Before 05.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/are-you-before/episodes/are-you-before-5th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Are You Before</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">05.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="rock-folk" href="/explore/genre/rock-folk">Folk</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="ambientnewage-kosmiche"
                href="/explore/genre/ambientnewage-kosmiche">Kosmische</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="ambientnewage-ambient" href="/explore/genre/ambientnewage-ambient">Ambient</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/are-you-before-5th-february-2018/" data-permalink="/shows/are-you-before/episodes/are-you-before-5th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/are-you-before/episodes/are-you-before-5th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/d8b93042-13f1-4cda-9790-dd90bb75cec2_1512345600.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/d8b93042-13f1-4cda-9790-dd90bb75cec2_1512345600.jpeg" alt="Lil Mofo 05.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/lil-mofo-5th-february-2018/" data-permalink="/shows/lil-mofo/episodes/lil-mofo-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/lil-mofo/episodes/lil-mofo-5th-february-2018"><img src="https://media.ntslive.co.uk/resize/800x800/d8b93042-13f1-4cda-9790-dd90bb75cec2_1512345600.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/d8b93042-13f1-4cda-9790-dd90bb75cec2_1512345600.jpeg" alt="Lil Mofo 05.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/lil-mofo/episodes/lil-mofo-5th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Lil Mofo</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">05.02.18</p>
                <p class="nts-grid-item__subtitle__right">TKY</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="housetechno-electro" href="/explore/genre/housetechno-electro">Electro</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="avantgarde-experimental" href="/explore/genre/avantgarde-experimental">Experimental</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="housetechno-techno-leftfieldtechno" href="/explore/genre/housetechno-techno-leftfieldtechno">Leftfield Techno</a>          </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/lil-mofo-5th-february-2018/" data-permalink="/shows/lil-mofo/episodes/lil-mofo-5th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/lil-mofo/episodes/lil-mofo-5th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
    </div>
    """
  @http
  Scenario: Refresh a platform without any episodes
    When I refresh the Platform
    Then the episodes list should contain some episodes
  
  @http
  Scenario: Refresh a platform that has some episodes
    When I add some episodes
    When I refresh the Platform
    Then only new episodes are added to the platform