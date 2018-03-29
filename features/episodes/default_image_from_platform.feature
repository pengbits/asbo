Feature: Use Default Image from Platform
As a developer
In order to render an image for the episode even when it's not available
I want to provide a default image from the platform

    @episode @images
    Scenario: image is unavailable for episode
      Given the platform nickname=rinse
      And html for an episode
      """
      <div class="borderbottom left podcast-list-item" id="neptizzle290318">
        <div class="left w8-16">
          <h3 class="darkgrey tstarheavyupper px15 mb8">Neptizzle </h3>
          <div class="listen icon soundcloud">
            <a href="https://soundcloud.com/rinsefm/neptizzle290318" nclick="__gaTracker('send', 'event', 'openpodcastinplayer', 'soundcloud_podcastpage', 'Podcast: Neptizzle  ');" class="bgsoundcloudorange soundcloud-link" data-airtime="11" data-air-day="2018-03-29"
              data-artist="Neptizzle  ">&nbsp;</a>
            <a href="http://podcast.dgen.net/rinsefm/podcast/Neptizzle290318.mp3" class="bglightblue alt-link" style="display:none" data-airtime="11" data-air-day="2018-03-29" data-artist="Neptizzle  ">&nbsp;</a>
          </div>
          <div class="listen icon">
            <a href="http://podcast.dgen.net/rinsefm/podcast/Neptizzle290318.mp3" class="bglightblue" onclick="__gaTracker('send', 'event', 'openpodcastinplayer', 'podcastpage', 'Podcast: Neptizzle  ');" data-airtime="11" data-air-day="2018-03-29" data-artist="Neptizzle  ">&nbsp;</a>
          </div>
          <div class="download icon">
            <a href="http://podcast.dgen.net/rinsefm/podcast/Neptizzle290318.mp3" download="http://podcast.dgen.net/rinsefm/podcast/Neptizzle290318.mp3" target="_blank" class="bglavender" title="Right Click and Save As to Download">&nbsp;</a>
          </div>
        </div>
      </div>
      """
      
      When I parse the html
      Then the episode will have this fallback image 'http://getdarker-cdn-2ezlhsfwy1f.stackpathdns.com/wp-content/uploads/2006/02/27347_logo1112.png'