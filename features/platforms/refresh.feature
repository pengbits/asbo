Feature: Refresh Platform
  In order to get the latest episodes
  As a User
  I want to refresh the Platform by connecting to the remote host
  And scraping the latest episodes page
  
  Background: 
    Given the platform nickname=nts
    
  @http @empty
  Scenario: Refresh a platform without any episodes
    When I refresh the Platform
    Then the episodes list should contain some episodes
  
  @http
  Scenario: Refresh a platform that already has some episodes
    Given this html for multiple entries
    """
    <!-- outdated markup! -->
    <div class="nts-grid clearfix">
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/e9a5e3ba-039e-48dc-b770-2d935da95f30_1504742400.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/e9a5e3ba-039e-48dc-b770-2d935da95f30_1504742400.jpeg" alt="Reverie  14.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/reverie-14th-february-2018/" data-permalink="/shows/reverie/episodes/reverie-14th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/reverie/episodes/reverie-14th-february-2018"><img src="https://media.ntslive.co.uk/resize/800x800/e9a5e3ba-039e-48dc-b770-2d935da95f30_1504742400.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/e9a5e3ba-039e-48dc-b770-2d935da95f30_1504742400.jpeg" alt="Reverie  14.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/reverie/episodes/reverie-14th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Reverie </div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">14.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="housetechno-techno" href="/explore/genre/housetechno-techno">Techno</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="avantgarde-experimental" href="/explore/genre/avantgarde-experimental">Experimental</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="housetechno-house-leftfieldhouse" href="/explore/genre/housetechno-house-leftfieldhouse">Leftfield House</a>          </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/reverie-14th-february-2018/" data-permalink="/shows/reverie/episodes/reverie-14th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/reverie/episodes/reverie-14th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/c539592e-8806-429c-b8e8-fab14a3d0b2d_1516233600.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/c539592e-8806-429c-b8e8-fab14a3d0b2d_1516233600.jpeg" alt="Anu &amp; Andy Garvey  13.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/anu-andy-garvey-13th-february-2018/" data-permalink="/shows/anu/episodes/anu-13th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/anu/episodes/anu-13th-february-2018"><img src="https://media.ntslive.co.uk/resize/800x800/c539592e-8806-429c-b8e8-fab14a3d0b2d_1516233600.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/c539592e-8806-429c-b8e8-fab14a3d0b2d_1516233600.jpeg" alt="Anu &amp; Andy Garvey  13.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/anu/episodes/anu-13th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Anu &amp; Andy Garvey </div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">13.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="housetechno-techno" href="/explore/genre/housetechno-techno">Techno</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="housetechno-house" href="/explore/genre/housetechno-house">House</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/anu-andy-garvey-13th-february-2018/" data-permalink="/shows/anu/episodes/anu-13th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/anu/episodes/anu-13th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/d7478423-8430-4a08-8b46-bae3653087f8_1518566400.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/d7478423-8430-4a08-8b46-bae3653087f8_1518566400.jpeg" alt="Karen O 13.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/karen-o-13th-february-2018/" data-permalink="/shows/guests/episodes/karen-o-13th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/guests/episodes/karen-o-13th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/d7478423-8430-4a08-8b46-bae3653087f8_1518566400.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/d7478423-8430-4a08-8b46-bae3653087f8_1518566400.jpeg" alt="Karen O 13.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/guests/episodes/karen-o-13th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Karen O</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">13.02.18</p>
                <p class="nts-grid-item__subtitle__right">LA</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="altrockpunk-indie" href="/explore/genre/altrockpunk-indie">Indie</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="other-pop" href="/explore/genre/other-pop">Pop</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="postpunkwave-newwave" href="/explore/genre/postpunkwave-newwave">New Wave</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/karen-o-13th-february-2018/" data-permalink="/shows/guests/episodes/karen-o-13th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/guests/episodes/karen-o-13th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/368b661b-10c3-41d9-bae2-afb6d60c926e_1458086400.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/368b661b-10c3-41d9-bae2-afb6d60c926e_1458086400.jpeg" alt="Nitetrax 13.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/nitetrax-13th-february-2018/" data-permalink="/shows/nitetrax/episodes/nitetrax-13th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/nitetrax/episodes/nitetrax-13th-february-2018"><img src="https://media.ntslive.co.uk/resize/800x800/368b661b-10c3-41d9-bae2-afb6d60c926e_1458086400.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/368b661b-10c3-41d9-bae2-afb6d60c926e_1458086400.jpeg" alt="Nitetrax 13.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/nitetrax/episodes/nitetrax-13th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Nitetrax</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">13.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="housetechno-techno" href="/explore/genre/housetechno-techno">Techno</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="newclub-bass" href="/explore/genre/newclub-bass">Bass</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="newclub-footwork" href="/explore/genre/newclub-footwork">Footwork</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/nitetrax-13th-february-2018/" data-permalink="/shows/nitetrax/episodes/nitetrax-13th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/nitetrax/episodes/nitetrax-13th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/4eca7737-bfb5-40a3-ab0a-e3f5427de362_1518566400.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/4eca7737-bfb5-40a3-ab0a-e3f5427de362_1518566400.jpeg" alt="The Slip 13.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/the-slip-13th-february-2018/" data-permalink="/shows/theslip/episodes/the-slip-13th-february-2017"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/theslip/episodes/the-slip-13th-february-2017"><img src="https://media2.ntslive.co.uk/resize/800x800/4eca7737-bfb5-40a3-ab0a-e3f5427de362_1518566400.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/4eca7737-bfb5-40a3-ab0a-e3f5427de362_1518566400.jpeg" alt="The Slip 13.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/theslip/episodes/the-slip-13th-february-2017" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">The Slip</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">13.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="postpunkwave-newwave" href="/explore/genre/postpunkwave-newwave">New Wave</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="avantgarde-experimental" href="/explore/genre/avantgarde-experimental">Experimental</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="caribbean-dub" href="/explore/genre/caribbean-dub">Dub</a>          </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/the-slip-13th-february-2018/" data-permalink="/shows/theslip/episodes/the-slip-13th-february-2017"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/theslip/episodes/the-slip-13th-february-2017">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/aead1cb4-bf61-4f91-9028-d368540f3c9f_1518566400.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/aead1cb4-bf61-4f91-9028-d368540f3c9f_1518566400.jpeg" alt="Optimo 13.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/optimo-13th-february-2018/" data-permalink="/shows/optimo/episodes/optimo-13th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/optimo/episodes/optimo-13th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/aead1cb4-bf61-4f91-9028-d368540f3c9f_1518566400.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/aead1cb4-bf61-4f91-9028-d368540f3c9f_1518566400.jpeg" alt="Optimo 13.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/optimo/episodes/optimo-13th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Optimo</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">13.02.18</p>
                <p class="nts-grid-item__subtitle__right">GLA</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="housetechno-electro" href="/explore/genre/housetechno-electro">Electro</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="postpunkwave-ebm" href="/explore/genre/postpunkwave-ebm">EBM</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="postpunkwave-postpunk" href="/explore/genre/postpunkwave-postpunk">Post Punk</a>          <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="postpunkwave-industrial" href="/explore/genre/postpunkwave-industrial">Industrial</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="caribbean-dub" href="/explore/genre/caribbean-dub">Dub</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/optimo-13th-february-2018/" data-permalink="/shows/optimo/episodes/optimo-13th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/optimo/episodes/optimo-13th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/b8f5dcc0-9f6c-4f11-a1aa-87005aed17bc_1518566400.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/b8f5dcc0-9f6c-4f11-a1aa-87005aed17bc_1518566400.jpeg" alt="Zuli &amp; Marwa 13.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/zuli-13th-february-2018/" data-permalink="/shows/ZULI/episodes/zuli-13th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/ZULI/episodes/zuli-13th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/b8f5dcc0-9f6c-4f11-a1aa-87005aed17bc_1518566400.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/b8f5dcc0-9f6c-4f11-a1aa-87005aed17bc_1518566400.jpeg" alt="Zuli &amp; Marwa 13.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/ZULI/episodes/zuli-13th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Zuli &amp; Marwa</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">13.02.18</p>
                <p class="nts-grid-item__subtitle__right">CAI</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="electronicadowntempo-glitch" href="/explore/genre/electronicadowntempo-glitch">Glitch</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="avantgarde-experimental" href="/explore/genre/avantgarde-experimental">Experimental</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="housetechno-techno-leftfieldtechno" href="/explore/genre/housetechno-techno-leftfieldtechno">Leftfield Techno</a>          <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="avantgarde-drone" href="/explore/genre/avantgarde-drone">Drone</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/zuli-13th-february-2018/" data-permalink="/shows/ZULI/episodes/zuli-13th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/ZULI/episodes/zuli-13th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/f752ee16-4f56-478f-ae33-05aec220631a_1449761202.jpg" data-src="https://media.ntslive.co.uk/resize/800x800/f752ee16-4f56-478f-ae33-05aec220631a_1449761202.jpg" alt="Jazzman 13.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/jazzman-13th-february-2018/" data-permalink="/shows/jazzman/episodes/jazzman-13th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/jazzman/episodes/jazzman-13th-february-2018"><img src="https://media.ntslive.co.uk/resize/800x800/f752ee16-4f56-478f-ae33-05aec220631a_1449761202.jpg" data-src="https://media.ntslive.co.uk/resize/800x800/f752ee16-4f56-478f-ae33-05aec220631a_1449761202.jpg" alt="Jazzman 13.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/jazzman/episodes/jazzman-13th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Jazzman</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">13.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="latinbrazil-latinjazz" href="/explore/genre/latinbrazil-latinjazz">Latin Jazz</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="jazz-straightjazz" href="/explore/genre/jazz-straightjazz">Straight Jazz</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="soulrhythm-rhythmandblues" href="/explore/genre/soulrhythm-rhythmandblues">Rhythm &amp; Blues</a>          <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="soulrhythm-doowop" href="/explore/genre/soulrhythm-doowop">Doo Wop</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/jazzman-13th-february-2018/" data-permalink="/shows/jazzman/episodes/jazzman-13th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/jazzman/episodes/jazzman-13th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/6f057551-83e0-4309-a954-34db5c9c097a_1439302583.jpg" data-src="https://media.ntslive.co.uk/resize/800x800/6f057551-83e0-4309-a954-34db5c9c097a_1439302583.jpg" alt="Noise In My Head w/ PLO Man  13.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/noise-in-my-head-w-plo-man-13th-february-2018/" data-permalink="/shows/noise-in-my-head/episodes/noise-in-my-head-w-plo-man-13th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/noise-in-my-head/episodes/noise-in-my-head-w-plo-man-13th-february-2018"><img src="https://media.ntslive.co.uk/resize/800x800/6f057551-83e0-4309-a954-34db5c9c097a_1439302583.jpg" data-src="https://media.ntslive.co.uk/resize/800x800/6f057551-83e0-4309-a954-34db5c9c097a_1439302583.jpg" alt="Noise In My Head w/ PLO Man  13.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/noise-in-my-head/episodes/noise-in-my-head-w-plo-man-13th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Noise In My Head w/ PLO Man </div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">13.02.18</p>
                <p class="nts-grid-item__subtitle__right">MLB</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="postpunkwave-newbeat" href="/explore/genre/postpunkwave-newbeat">New Beat</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="housetechno-house" href="/explore/genre/housetechno-house">House</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="housetechno-house-leftfieldhouse" href="/explore/genre/housetechno-house-leftfieldhouse">Leftfield House</a>          <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="caribbean-dub" href="/explore/genre/caribbean-dub">Dub</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/noise-in-my-head-w-plo-man-13th-february-2018/" data-permalink="/shows/noise-in-my-head/episodes/noise-in-my-head-w-plo-man-13th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/noise-in-my-head/episodes/noise-in-my-head-w-plo-man-13th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/369c5b79-6222-4791-822d-871b1911db4d_1518566400.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/369c5b79-6222-4791-822d-871b1911db4d_1518566400.jpeg" alt="Ted Draws - 1997 Special 13.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/ted-draws-13th-february-2018/" data-permalink="/shows/TED-DRAWS/episodes/ted-draws-13th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/TED-DRAWS/episodes/ted-draws-13th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/369c5b79-6222-4791-822d-871b1911db4d_1518566400.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/369c5b79-6222-4791-822d-871b1911db4d_1518566400.jpeg" alt="Ted Draws - 1997 Special 13.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/TED-DRAWS/episodes/ted-draws-13th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Ted Draws - 1997 Special</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">13.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="hiphoprandb-ganstarap" href="/explore/genre/hiphoprandb-ganstarap">Gangsta Rap</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="hiphoprandb-classichiphop" href="/explore/genre/hiphoprandb-classichiphop">Classic Hip Hop</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="hiphoprandb-hiphop" href="/explore/genre/hiphoprandb-hiphop">Hip Hop</a>          </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/ted-draws-13th-february-2018/" data-permalink="/shows/TED-DRAWS/episodes/ted-draws-13th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/TED-DRAWS/episodes/ted-draws-13th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/0f3d22ad-600d-4be4-a568-9720f090a79f_1518566400.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/0f3d22ad-600d-4be4-a568-9720f090a79f_1518566400.jpeg" alt="Obongjayar 13.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/obongjayar-13th-february-2018/" data-permalink="/shows/guests/episodes/obongjayar-13th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/guests/episodes/obongjayar-13th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/0f3d22ad-600d-4be4-a568-9720f090a79f_1518566400.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/0f3d22ad-600d-4be4-a568-9720f090a79f_1518566400.jpeg" alt="Obongjayar 13.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/guests/episodes/obongjayar-13th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Obongjayar</div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">13.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="housetechno-house" href="/explore/genre/housetechno-house">House</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="electronicadowntempo-beats" href="/explore/genre/electronicadowntempo-beats">Beats</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="hiphoprandb-hiphop" href="/explore/genre/hiphoprandb-hiphop">Hip Hop</a>          </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/obongjayar-13th-february-2018/" data-permalink="/shows/guests/episodes/obongjayar-13th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/guests/episodes/obongjayar-13th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
      <div class="nts-grid-item-container">
        <div class="nts-grid-item">
          <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/be821079-cdc0-4e1d-aac1-86cb5c244516_1518566400.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/be821079-cdc0-4e1d-aac1-86cb5c244516_1518566400.jpeg" alt="Nabihah Iqbal  13.02.18 Radio Episode"
              class="img preload-img">
            <div class="nts-grid-item__img__overlay">
              <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/nabihah-iqbal-13th-february-2018/" data-permalink="/shows/nabihah-iqbal/episodes/nabihah-iqbal-13th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
              </div>
            </div>
          </div>
          <div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/nabihah-iqbal/episodes/nabihah-iqbal-13th-february-2018"><img src="https://media2.ntslive.co.uk/resize/800x800/be821079-cdc0-4e1d-aac1-86cb5c244516_1518566400.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/be821079-cdc0-4e1d-aac1-86cb5c244516_1518566400.jpeg" alt="Nabihah Iqbal  13.02.18 Radio Episode"
              class="img preload-img"></div>
          <a href="/shows/nabihah-iqbal/episodes/nabihah-iqbal-13th-february-2018" class="nts-app nts-link nts-link--nohover">
            <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
              <div class="nts-grid-item__title">Nabihah Iqbal </div>
              <div class="nts-grid-item__subtitle">
                <p class="nts-grid-item__subtitle__left">13.02.18</p>
                <p class="nts-grid-item__subtitle__right">LDN</p>
              </div>
            </div>
          </a>
          <div class="nts-grid-item__footer">
            <div class="nts-grid-item__genres"> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="genres-africanmiddleeast-south-african-jazz" href="/explore/genre/genres-africanmiddleeast-south-african-jazz">South African Jazz</a> <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event"
                data-tag-id="jazz-souljazz" href="/explore/genre/jazz-souljazz">Soul Jazz</a> </div>
            <div class="nts-grid-item__action-btns">
              <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/nabihah-iqbal-13th-february-2018/" data-permalink="/shows/nabihah-iqbal/episodes/nabihah-iqbal-13th-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/nabihah-iqbal/episodes/nabihah-iqbal-13th-february-2018">TRACKLIST</a></div>
          </div>
        </div>
      </div>
    </div>
    """
    When I add some episodes
      |name|date_str|details|
      |Reverie  14.02.18 Radio Episode|14.02.18|http://nts.live/foo|
      |Anu & Andy Garvey  13.02.18 Radio Episode|13.02.18|http://nts.live/foo|
      |Karen O 13.02.18 Radio Episode|13.02.18|http://nts.live/foo|
      |Nitetrax 13.02.18 Radio Episode|13.02.18|http://nts.live/foo|
      |The Slip 13.02.18 Radio Episode|13.02.18|http://nts.live/foo|
      |Optimo 13.02.18 Radio Episode|13.02.18|http://nts.live/foo|
      |Zuli & Marwa 13.02.18 Radio Episode|13.02.18|http://nts.live/foo|
      |Jazzman 13.02.18 Radio Episode|13.02.18|http://nts.live/foo|
      |Noise In My Head w/ PLO Man  13.02.18 Radio Episode|13.02.18|http://nts.live/foo|
   
    When I call create_episodes_from_html on platform
    Then only the new episodes are added to the platform
      |name|date_str|
      |Ted Draws - 1997 Special 13.02.18 Radio Episode|13.02.18|
      |Obongjayar 13.02.18 Radio Episode|13.02.18|
      |Nabihah Iqbal  13.02.18 Radio Episode|13.02.18|
  
  @http @nts @pagination
  Scenario: Remember the last page captured in refresh
    Given the platform's last_page is 2
     When I refresh the Platform
     Then the platform's last_page is incremented to 3