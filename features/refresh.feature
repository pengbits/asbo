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

  @http
  Scenario: Refresh a platform without any episodes
    When I refresh the Platform
    Then the episodes list should contain some episodes
  
  @http
  Scenario: Refresh a platform that already has some episodes
    Given this html
    """
    <div class="nts-grid clearfix">
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/0923de95-b34c-43c2-a583-8814c8401dd5_1432152716.jpg" data-src="https://media.ntslive.co.uk/resize/800x800/0923de95-b34c-43c2-a583-8814c8401dd5_1432152716.jpg" 
alt="A Fist in the Face of God presents: Midnite Madness 07.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/midnite-madness-7th-february-2018/" data-permalink="/shows/midnite-madness/episodes/a-fist-in-the-face-of-god-presents-midnite-madness-7th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/7af8497e-cdc1-473f-8416-c53b86ebc79a_1517788800.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/7af8497e-cdc1-473f-8416-c53b86ebc79a_1517788800.jpeg" 
alt="Ossia 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/ossia-6th-february-2018/" data-permalink="/shows/guests/episodes/ossia-6th-february-2017"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/bdc6ef82-17e5-47e4-9a77-4f6f26efe011_1480636800.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/bdc6ef82-17e5-47e4-9a77-4f6f26efe011_1480636800.jpeg" 
alt="Out of Hours w/ Jak Ryan 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/out-of-hours-w-jak-ryan-6th-february-2018/" data-permalink="/shows/jak-ryan/episodes/jak-ryan-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/ec5df85e-4836-4187-8855-0ed9af1ff3e3_1517788800.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/ec5df85e-4836-4187-8855-0ed9af1ff3e3_1517788800.jpeg" 
alt="Iona Fortune 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/iona-fortune-6th-february-2018/" data-permalink="/shows/guests/episodes/iona-fortune-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/f8cef156-b532-4fff-b350-ed63ce92ac4c_1517961600.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/f8cef156-b532-4fff-b350-ed63ce92ac4c_1517961600.jpeg" 
alt="Paradise Bangkok w/ Paul Rekret  06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/paradise-bangkok-6th-february-2018/" data-permalink="/shows/paradise-bangkok/episodes/paradise-bangkok-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/a519bb56-23c5-4981-a2d3-8c5917d60885_1517961600.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/a519bb56-23c5-4981-a2d3-8c5917d60885_1517961600.jpeg" 
alt="Cherrystones 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/cherrystones-6th-february-2018/" data-permalink="/shows/cherrystones/episodes/cherrystones-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/c9d07908-f7c6-4f9b-b9c5-2fa0c2c8497e_1517961600.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/c9d07908-f7c6-4f9b-b9c5-2fa0c2c8497e_1517961600.jpeg" 
alt="Tuesday Trips w/ Nahhg &amp; Ewonee 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/tuesday-trips-w-nahhg-6th-february-2018/" data-permalink="/shows/tuesday-trips/episodes/tuesday-trips-w-nahhg-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/81b6caeb-0909-433d-8631-04eaefe22235_1517961600.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/81b6caeb-0909-433d-8631-04eaefe22235_1517961600.jpeg" 
alt="Mark Leckey 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/mark-leckey-6th-february-2018/" data-permalink="/shows/mark-leckey/episodes/mark-leckey-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/c87748c4-9354-4b16-bf47-c5d0daac36cd_1501113600.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/c87748c4-9354-4b16-bf47-c5d0daac36cd_1501113600.jpeg" 
alt="Felix Hall 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/felix-hall-6th-february-2018/" data-permalink="/shows/felix-hall/episodes/felix-hall-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/3a7e99dd-c8d5-444d-8ae2-6af078bfda52_1434116931.jpg" data-src="https://media.ntslive.co.uk/resize/800x800/3a7e99dd-c8d5-444d-8ae2-6af078bfda52_1434116931.jpg" 
alt="Prosumer &amp; Kate Harahan 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/prosumer-6th-february-2018/" data-permalink="/shows/prosumer/episodes/prosumer-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/54ec28fa-75e8-404a-9fea-d95a1ae3d1ce_1517961600.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/54ec28fa-75e8-404a-9fea-d95a1ae3d1ce_1517961600.jpeg" 
alt="JAYDA G 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/jayda-g-6th-february-2018/" data-permalink="/shows/jayda-g/episodes/jayda-g-6th-february2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/a6056e58-b254-4596-afde-6d96c76e9f39_1501113600.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/a6056e58-b254-4596-afde-6d96c76e9f39_1501113600.jpeg" 
alt="Donna Leake 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/raga-vibrations-5th-february-2018/" data-permalink="/shows/raga-vibrations/episodes/raga-vibrations-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/f5a00d2d-62fc-44d7-b864-96635fabe818_1516665600.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/f5a00d2d-62fc-44d7-b864-96635fabe818_1516665600.jpeg" 
alt="The Do!! You!!! Breakfast Show w/ Charlie Bones &amp; Jack Rollo  05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/the-do-you-breakfast-show-w-charlie-bones-5th-february-2018/" data-permalink="/shows/the-do-you-breakfast-show/episodes/the-do-you-breakfast-show-w-charlie-bones-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/ec779695-7b04-4cff-bf57-abcb6edcf244_1492560000.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/ec779695-7b04-4cff-bf57-abcb6edcf244_1492560000.jpeg" 
alt="Slime w/ Little 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/slime-w-little-4th-february-2018/" data-permalink="/shows/slime-w-little/episodes/slime-w-little-4th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
    </div>
    """
    When I add some episodes
      |name|date|
      |A Fist in the Face of God presents: Midnite Madness 07.02.18 Radio Episode|07.02.18|
      |Ossia 06.02.18 Radio Episode|06.02.18|
      |Out of Hours w/ Jak Ryan 06.02.18 Radio Episode|06.02.18|
      |Iona Fortune 06.02.18 Radio Episode|06.02.18|
      |Paradise Bangkok w/ Paul Rekret  06.02.18 Radio Episode|06.02.18|
      |Cherrystones 06.02.18 Radio Episode|06.02.18|
      |Tuesday Trips w/ Nahhg & Ewonee 06.02.18 Radio Episode|06.02.18|
      |Mark Leckey 06.02.18 Radio Episode|06.02.18|
      |Felix Hall 06.02.18 Radio Episode|06.02.18|
      |Prosumer & Kate Harahan 06.02.18 Radio Episode|06.02.18|
      |JAYDA G 06.02.18 Radio Episode|06.02.18|
      |Donna Leake 06.02.18 Radio Episode|06.02.18|
   
    When I call create_episodes_from_html on the platform
    Then only the two new episodes are added to the platform