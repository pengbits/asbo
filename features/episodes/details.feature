Feature: Details
As a User
In order to get more context for the episode (tracklisting, download link)
I want a link to the episode details when available

@details @radar @success
Scenario: a platform with has_details=true will include a details url in episodes
  Given the platform nickname=radar
  And the platform has details=true in its configuration  
  And html for an episode
  """
  <article class="latestarticle radarradio_podcasts">
  <header class="latestheader"><span><a href="/podcasts/tarquin-w-le-dom-2nd-apr"><img width="814" height="814" src="/wp-content/uploads/2018/04/Screen-Shot-2018-04-03-at-13.23.19tarquin.jpg" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="" srcset="/wp-content/uploads/2018/04/Screen-Shot-2018-04-03-at-13.23.19tarquin.jpg 814w, /wp-content/uploads/2018/04/Screen-Shot-2018-04-03-at-13.23.19tarquin-150x150.jpg 150w, /wp-content/uploads/2018/04/Screen-Shot-2018-04-03-at-13.23.19tarquin-300x300.jpg 300w, /wp-content/uploads/2018/04/Screen-Shot-2018-04-03-at-13.23.19tarquin-768x768.jpg 768w" sizes="(max-width: 814px) 100vw, 814px"></a></span></header>
  <section class="latestcontent"><h2><a href="/podcasts/tarquin-w-le-dom-2nd-apr">Tarquin w/ Le Dom – 2nd Apr</a></h2><p></p><div class="radarradio_podcasts_listen_button"><a href="/podcasts/tarquin-w-le-dom-2nd-apr" title="Listen">Listen</a></div><p></p></section></article> 
  """

  When I parse the html
  Then the platform will contain an episode with this url
  """
  https://www.radarradio.com/podcasts/tarquin-w-le-dom-2nd-apr
  """

@details
Scenario: a platform with has_details=false will not include a details url in episodes
  Given the platform nickname=rinse
  And html for an episode
  """
  <div class="borderbottom left podcast-list-item" id="uncledugs230218-mp3">
    <div class="left w8-16">
      <h3 class="darkgrey tstarheavyupper px15 mb8">
  Uncle Dugs </h3>
      <div class="listen icon soundcloud">
        <a href="https://soundcloud.com/rinsefm/uncledugs230218" nclick="__gaTracker('send', 'event', 'openpodcastinplayer', 'soundcloud_podcastpage', 'Podcast: Uncle Dugs');" class="bgsoundcloudorange soundcloud-link" data-airtime="11" data-air-day="2018-02-23"
          data-artist="Uncle Dugs">&nbsp;</a>
        <a href="http://podcast.dgen.net/rinsefm/podcast/uncledugs230218.mp3" class="bglightblue alt-link" style="display:none" data-airtime="11" data-air-day="2018-02-23" data-artist="Uncle Dugs">&nbsp;</a>
      </div>
      <div class="listen icon">
        <a href="http://podcast.dgen.net/rinsefm/podcast/uncledugs230218.mp3" class="bglightblue" onclick="__gaTracker('send', 'event', 'openpodcastinplayer', 'podcastpage', 'Podcast: Uncle Dugs');" data-airtime="11" data-air-day="2018-02-23" data-artist="Uncle Dugs">&nbsp;</a>
      </div>
      <div class="download icon">
        <a href="http://podcast.dgen.net/rinsefm/podcast/uncledugs230218.mp3" download="http://podcast.dgen.net/rinsefm/podcast/uncledugs230218.mp3" target="_blank" class="bglavender" title="Right Click and Save As to Download">&nbsp;</a>
      </div>
    </div>
    <!-- snip -->
  </div>  
  """
  When I parse the html
  Then the platform will not contain any details urls in its episodes 