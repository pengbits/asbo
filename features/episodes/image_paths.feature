Feature: Normalize Image Paths
As a developer
In order to render an image for the episode when available 
I want to prefix relative paths with the platform's base path

  @episode @images @absolute
  Scenario: image is absolute
    Given the platform nickname=nts
    And the platform has relative_image_paths='false'
    And html for an episode
    """
    <article class="nts-grid-v2-item">
      <div class="nts-grid-v2-item__content">
        <div class="nts-grid-picture"><img class="nts-grid-picture__img preload-img" alt="Mija MGMT w/ San Cha" src="https://media2.ntslive.co.uk/resize/800x800/58dab62a-db5d-4bc9-9c2c-9708a6b846c8_1571097600.jpeg"
            data-src="https://media2.ntslive.co.uk/resize/800x800/58dab62a-db5d-4bc9-9c2c-9708a6b846c8_1571097600.jpeg">
        </div>
      </div>
    </article>
    """

    When I parse the html
    Then the platform will contain an episode with this image 'https://media2.ntslive.co.uk/resize/800x800/58dab62a-db5d-4bc9-9c2c-9708a6b846c8_1571097600.jpeg'

    @episode @images
    Scenario: image is absolute
      Given the platform nickname=radar
      And the platform has relative_image_paths='true'
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
      Then the platform will contain an episode with this image 'https://www.radarradio.com/wp-content/uploads/2018/03/RADAR-RUN-IT-8-FOOZOOL.png'