Feature: Media
As a Developer
In order to provide better context around the media enclosure
I want to identify them as belonging to either mixcloud or soundcloud

@media @mixcloud
Scenario: nts x mixcloud
  Given the platform key=nts
  And html for an episode
  """
    <div class="nts-grid-item"><div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/8daa0f85-a541-47a1-88cf-26c18ebf342f_1444643834.jpg" data-src="https://media.ntslive.co.uk/resize/800x800/8daa0f85-a541-47a1-88cf-26c18ebf342f_1444643834.jpg" alt="Grandmixxer 22.02.18 Radio Episode" class="img preload-img"><div class="nts-grid-item__img__overlay"><div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/grandmixxer-22nd-february-2018/" data-permalink="/shows/grandmixxer/episodes/grandmixxer-22nd-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span></div></div></div><div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/grandmixxer/episodes/grandmixxer-22nd-february-2018"><img src="https://media.ntslive.co.uk/resize/800x800/8daa0f85-a541-47a1-88cf-26c18ebf342f_1444643834.jpg" data-src="https://media.ntslive.co.uk/resize/800x800/8daa0f85-a541-47a1-88cf-26c18ebf342f_1444643834.jpg" alt="Grandmixxer 22.02.18 Radio Episode" class="img preload-img"></div><a href="/shows/grandmixxer/episodes/grandmixxer-22nd-february-2018" class="nts-app nts-link nts-link--nohover"><div class="nts-grid-item__header text-bold nts-link nts-link--highlighted"><div class="nts-grid-item__title">Grandmixxer</div><div class="nts-grid-item__subtitle"><p class="nts-grid-item__subtitle__left">22.02.18</p><p class="nts-grid-item__subtitle__right">LDN</p></div></div></a><div class="nts-grid-item__footer">  <div class="nts-grid-item__genres">  <a class="genre-tag nts-app nts-link nts-link--highlighted genre-search-click-event" data-tag-id="ukdance-grime" href="/explore/genre/ukdance-grime">Grime</a>  </div>  <div class="nts-grid-item__action-btns"><button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/grandmixxer-22nd-february-2018/" data-permalink="/shows/grandmixxer/episodes/grandmixxer-22nd-february-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/grandmixxer/episodes/grandmixxer-22nd-february-2018">TRACKLIST</a></div></div></div>
  """
  When I parse the html
  Then the platform will contain an episode with this media property
  |type|url|x|
  |mixcloud|https://www.mixcloud.com/NTSRadio/grandmixxer-22nd-february-2018/|"|


@media @soundcloud
Scenario: rinse x soundcloud
  Given the platform key=rinse
  And html for an episode
  """
    <div class="borderbottom left podcast-list-item" id="conducta260218"><div class="left w8-16"><h3 class="darkgrey tstarheavyupper px15 mb8">
    Conducta </h3><div class="listen icon soundcloud"><a href="https://soundcloud.com/rinsefm/conducta260218" nclick="__gaTracker('send', 'event', 'openpodcastinplayer', 'soundcloud_podcastpage', 'Podcast: Conducta');" class="bgsoundcloudorange soundcloud-link" data-airtime="11" data-air-day="2018-02-26"data-artist="Conducta">&nbsp;</a><a href="http://podcast.dgen.net/rinsefm/podcast/Conducta260218.mp3" class="bglightblue alt-link" style="display:none" data-airtime="11" data-air-day="2018-02-26" data-artist="Conducta">&nbsp;</a></div><div class="listen icon"><a href="http://podcast.dgen.net/rinsefm/podcast/Conducta260218.mp3" class="bglightblue" onclick="__gaTracker('send', 'event', 'openpodcastinplayer', 'podcastpage', 'Podcast: Conducta');" data-airtime="11" data-air-day="2018-02-26" data-artist="Conducta">&nbsp;</a></div><div class="download icon"><a href="http://podcast.dgen.net/rinsefm/podcast/Conducta260218.mp3" download="http://podcast.dgen.net/rinsefm/podcast/Conducta260218.mp3" target="_blank" class="bglavender" title="Right Click and Save As to Download">&nbsp;</a></div></div><!-- snip --><div class="soundcloud-player"></div>
    </div>  
  """
  When I parse the html
  Then the platform will contain an episode with this media property
  |type|url|
  |soundcloud|https://soundcloud.com/rinsefm/conducta260218|
