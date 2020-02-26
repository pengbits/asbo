Feature: Media Type
As a Developer
In order to provide better context around the media enclosure
I want to identify them as belonging to either mixcloud or soundcloud

@media @mixcloud
Scenario: nts x mixcloud
  Given the platform nickname=nts
  And html for an episode
  """
  <article class="nts-grid-v2-item"><div class="nts-grid-v2-item__content"><div class="nts-grid-picture"><img class="nts-grid-picture__img preload-img" alt="Hit A Lick Radio" src="https://media2.ntslive.co.uk/resize/800x800/2fa12bb5-b8a3-4984-9d79-d5f102ae3005_1571097600.png"data-src="https://media2.ntslive.co.uk/resize/800x800/2fa12bb5-b8a3-4984-9d79-d5f102ae3005_1571097600.png"><div role="button" tabindex="0" class="nts-grid-picture__overlay mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/hit-a-lick-14th-october-2019/"data-permalink="/shows/hit-a-lick/episodes/hit-a-lick-radio-14th-october-2019">&nbsp;</div></div><a class="nts-grid-v2-item__header nts-app" href="/shows/hit-a-lick/episodes/hit-a-lick-radio-14th-october-2019" data-track="event" data-category="Navigation" data-action="GoTo-Episode" data-label="from-gridItemTitle"><span>14.10.19</span><span>PHI</span><div class="nts-grid-v2-item__header__title">Hit A Lick Radio</div></a></div>
  </article>  
  """
  When I parse the html
  Then the platform will contain an episode with this media property
  |type|url|
  |mixcloud|https://www.mixcloud.com/NTSRadio/hit-a-lick-14th-october-2019/|


@media @soundcloud
Scenario: rinse x soundcloud
  Given the platform nickname=rinse
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
