Feature: Normalize Image Paths
As a developer
In order to render an image for the episode when available 
I want to prefix relative paths with the platform's base path

  @episode @images
  Scenario: image is absolute
    Given the platform nickname=nts
    And html for an episode
    """
      <div class="nts-grid-item"><div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/8daa0f85-a541-47a1-88cf-26c18ebf342f_1444643834.jpg" data-src="https://media.ntslive.co.uk/resize/800x800/8daa0f85-a541-47a1-88cf-26c18ebf342f_1444643834.jpg" alt="Grandmixxer 22.02.18 Radio Episode" class="img preload-img"><div class="nts-grid-item__img__overlay"><div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/grandmixxer-22nd-february-2018/" data-permalink="/shows/grandmixxer/episodes/grandmixxer-22nd-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span></div></div></div><div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/grandmixxer/episodes/grandmixxer-22nd-february-2018"><img src="https://media.ntslive.co.uk/resize/800x800/8daa0f85-a541-47a1-88cf-26c18ebf342f_1444643834.jpg" data-src="https://media.ntslive.co.uk/resize/800x800/8daa0f85-a541-47a1-88cf-26c18ebf342f_1444643834.jpg" alt="Grandmixxer 22.02.18 Radio Episode" class="img preload-img"></div><a href="/shows/grandmixxer/episodes/grandmixxer-22nd-february-2018" class="nts-app nts-link nts-link--nohover"><div class="nts-grid-item__header text-bold nts-link nts-link--highlighted"><div class="nts-grid-item__title">Grandmixxer</div><div class="nts-grid-item__subtitle"><p class="nts-grid-item__subtitle__left">22.02.18</p><p class="nts-grid-item__subtitle__right">LDN</p></div></div></a><div class="nts-grid-item__footer">  <div class="nts-grid-item__genres">  <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="ukdance-grime" href="/explore/genre/ukdance-grime">Grime</a>  </div>  <div class="nts-grid-item__action-btns"><button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/grandmixxer-22nd-february-2018/" data-permalink="/shows/grandmixxer/episodes/grandmixxer-22nd-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/grandmixxer/episodes/grandmixxer-22nd-february-2018">TRACKLIST</a></div></div></div>
    """

    When I parse the html
    Then the platform will contain an episode with this image 'https://media.ntslive.co.uk/resize/800x800/8daa0f85-a541-47a1-88cf-26c18ebf342f_1444643834.jpg'

    @episode @images
    Scenario: image is absolute
      Given the platform nickname=radar
      And html for an episode
      """
      <article class="latestarticle radarradio_podcasts">
      	<header class="latestheader">
      		<span><a href="/podcasts/radar-run-it-episode-8-w-foozool-27th-mar"><img width="1600" height="1600" src="/wp-content/uploads/2018/03/RADAR-RUN-IT-8-FOOZOOL.png" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="" srcset="/wp-content/uploads/2018/03/RADAR-RUN-IT-8-FOOZOOL.png 1600w, /wp-content/uploads/2018/03/RADAR-RUN-IT-8-FOOZOOL-150x150.png 150w, /wp-content/uploads/2018/03/RADAR-RUN-IT-8-FOOZOOL-300x300.png 300w, /wp-content/uploads/2018/03/RADAR-RUN-IT-8-FOOZOOL-768x768.png 768w, /wp-content/uploads/2018/03/RADAR-RUN-IT-8-FOOZOOL-1024x1024.png 1024w" sizes="(max-width: 1600px) 100vw, 1600px"></a></span>
      	</header>
      	<section class="latestcontent">
      		<h2><a href="/podcasts/radar-run-it-episode-8-w-foozool-27th-mar">Radar Run It: Episode 8 w/ Foozool – 27th Mar</a></h2>
      		<p>
      		</p>
      		<div class="radarradio_podcasts_listen_button"><a href="/podcasts/radar-run-it-episode-8-w-foozool-27th-mar" title="Listen">Listen</a></div>
      		<p></p>
      	</section>
      </article>    
      """

      When I parse the html
      Then the platform will contain an episode with this image 'http://www.radarradio.com/wp-content/uploads/2018/03/RADAR-RUN-IT-8-FOOZOOL.png'
