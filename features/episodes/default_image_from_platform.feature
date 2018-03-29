Feature: Use Default Image from Platform
As a developer
In order to render an image for the episode even when it's not available
I want to provide a default image from the platform

  Background: A platform with a default image
  Given the platform nickname=rinse
  And the platform has this default image 'https://etc.levels.io/rinse-fm/logo.png'
  
  @episode @images @default
  Scenario: image is unavailable for episode
    Given html for an episode
    """
    <div class="borderbottom left podcast-list-item" id="neptizzle290318">
      <div class="left w8-16">
        <h3 class="darkgrey tstarheavyupper px15 mb8">Neptizzle </h3>
        <div class="listen icon soundcloud">
          <a href="https://soundcloud.com/rinsefm/neptizzle290318" nclick="__gaTracker('send', 'event', 'openpodcastinplayer', 'soundcloud_podcastpage', 'Podcast: Neptizzle  ');" class="bgsoundcloudorange soundcloud-link" data-airtime="11" data-air-day="2018-03-29"
            data-artist="Neptizzle  ">&nbsp;</a>
          <a href="http://podcast.dgen.net/rinsefm/podcast/Neptizzle290318.mp3" class="bglightblue alt-link" style="display:none" data-airtime="11" data-air-day="2018-03-29" data-artist="Neptizzle  ">&nbsp;</a>
        </div>
        <div class="listen icon"></div>
        <div class="download icon"></div>
      </div>
    </div>
    """
    
    When I parse the html
    Then the platform will contain an episode with this image 'https://etc.levels.io/rinse-fm/logo.png'
  
  @episode @images @default
  Scenario: image is available for episode
    Given html for an episode
    """
    <div class="borderbottom left podcast-list-item" id="marcusnasty280318">
      <div class="left w8-16">
        <h3 class="darkgrey tstarheavyupper px15 mb8">Marcus Nasty with DJ POLO w/ Mic Man Frost, Scar Duggy w/ MC Sharky &amp; RB, DJ Georgia w/ Killa P, Dizzle Kid &amp; Friends </h3>
        <div class="listen icon soundcloud">
          <a href="https://soundcloud.com/rinsefm/marcusnasty280318" nclick="__gaTracker('send', 'event', 'openpodcastinplayer', 'soundcloud_podcastpage', 'Podcast: Marcus Nasty with DJ POLO w/ Mic Man Frost, Scar Duggy w/ MC Sharky &amp; RB, DJ Georgia w/ Killa P, Dizzle Kid &amp; Friends');"
            class="bgsoundcloudorange soundcloud-link" data-airtime="19" data-air-day="2018-03-28" data-artist="Marcus Nasty with DJ POLO w/ Mic Man Frost, Scar Duggy w/ MC Sharky &amp; RB, DJ Georgia w/ Killa P, Dizzle Kid &amp; Friends" data-img-src="http://rinse.fm/wp-content/uploads/2012/09/133x133_Marcus_Nasty.png">&nbsp;</a>
          <a href="http://podcast.dgen.net/rinsefm/podcast/MarcusNasty280318.mp3" class="bglightblue alt-link" style="display:none" data-airtime="19" data-air-day="2018-03-28" data-artist="Marcus Nasty with DJ POLO w/ Mic Man Frost, Scar Duggy w/ MC Sharky &amp; RB, DJ Georgia w/ Killa P, Dizzle Kid &amp; Friends"
            data-img-src="http://rinse.fm/wp-content/uploads/2012/09/133x133_Marcus_Nasty.png">&nbsp;</a>
        </div>
        <div class="listen icon"></div>
        <div class="download icon"></div>
    </div>
    """
    
    When I parse the html
    Then the platform will contain an episode with this image 'http://rinse.fm/wp-content/uploads/2012/09/133x133_Marcus_Nasty.png'
    