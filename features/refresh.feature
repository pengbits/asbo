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
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/0923de95-b34c-43c2-a583-8814c8401dd5_1432152716.jpg" data-src="https://media.ntslive.co.uk/resize/800x800/0923de95-b34c-43c2-a583-8814c8401dd5_1432152716.jpg" alt="A Fist in the Face of God presents: Midnite Madness 07.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/midnite-madness-7th-february-2018/" data-permalink="/shows/midnite-madness/episodes/a-fist-in-the-face-of-god-presents-midnite-madness-7th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/7af8497e-cdc1-473f-8416-c53b86ebc79a_1517788800.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/7af8497e-cdc1-473f-8416-c53b86ebc79a_1517788800.jpeg" alt="Ossia 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/ossia-6th-february-2018/" data-permalink="/shows/guests/episodes/ossia-6th-february-2017"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/bdc6ef82-17e5-47e4-9a77-4f6f26efe011_1480636800.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/bdc6ef82-17e5-47e4-9a77-4f6f26efe011_1480636800.jpeg" alt="Out of Hours w/ Jak Ryan 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/out-of-hours-w-jak-ryan-6th-february-2018/" data-permalink="/shows/jak-ryan/episodes/jak-ryan-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/ec5df85e-4836-4187-8855-0ed9af1ff3e3_1517788800.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/ec5df85e-4836-4187-8855-0ed9af1ff3e3_1517788800.jpeg" alt="Iona Fortune 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/iona-fortune-6th-february-2018/" data-permalink="/shows/guests/episodes/iona-fortune-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/f8cef156-b532-4fff-b350-ed63ce92ac4c_1517961600.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/f8cef156-b532-4fff-b350-ed63ce92ac4c_1517961600.jpeg" alt="Paradise Bangkok w/ Paul Rekret  06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/paradise-bangkok-6th-february-2018/" data-permalink="/shows/paradise-bangkok/episodes/paradise-bangkok-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/a519bb56-23c5-4981-a2d3-8c5917d60885_1517961600.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/a519bb56-23c5-4981-a2d3-8c5917d60885_1517961600.jpeg" alt="Cherrystones 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/cherrystones-6th-february-2018/" data-permalink="/shows/cherrystones/episodes/cherrystones-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/c9d07908-f7c6-4f9b-b9c5-2fa0c2c8497e_1517961600.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/c9d07908-f7c6-4f9b-b9c5-2fa0c2c8497e_1517961600.jpeg" alt="Tuesday Trips w/ Nahhg &amp; Ewonee 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/tuesday-trips-w-nahhg-6th-february-2018/" data-permalink="/shows/tuesday-trips/episodes/tuesday-trips-w-nahhg-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/81b6caeb-0909-433d-8631-04eaefe22235_1517961600.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/81b6caeb-0909-433d-8631-04eaefe22235_1517961600.jpeg" alt="Mark Leckey 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/mark-leckey-6th-february-2018/" data-permalink="/shows/mark-leckey/episodes/mark-leckey-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/c87748c4-9354-4b16-bf47-c5d0daac36cd_1501113600.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/c87748c4-9354-4b16-bf47-c5d0daac36cd_1501113600.jpeg" alt="Felix Hall 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/felix-hall-6th-february-2018/" data-permalink="/shows/felix-hall/episodes/felix-hall-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/3a7e99dd-c8d5-444d-8ae2-6af078bfda52_1434116931.jpg" data-src="https://media.ntslive.co.uk/resize/800x800/3a7e99dd-c8d5-444d-8ae2-6af078bfda52_1434116931.jpg" alt="Prosumer &amp; Kate Harahan 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/prosumer-6th-february-2018/" data-permalink="/shows/prosumer/episodes/prosumer-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/54ec28fa-75e8-404a-9fea-d95a1ae3d1ce_1517961600.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/54ec28fa-75e8-404a-9fea-d95a1ae3d1ce_1517961600.jpeg" alt="JAYDA G 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/jayda-g-6th-february-2018/" data-permalink="/shows/jayda-g/episodes/jayda-g-6th-february2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/a6056e58-b254-4596-afde-6d96c76e9f39_1501113600.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/a6056e58-b254-4596-afde-6d96c76e9f39_1501113600.jpeg" alt="Donna Leake 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/donna-leake-6th-february-2018/" data-permalink="/shows/donna-leake/episodes/donna-leake-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/53834f78-1d54-42a7-80c1-48fcbcdd345b_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/53834f78-1d54-42a7-80c1-48fcbcdd345b_1517875200.jpeg" alt="The Do!! You!!! Breakfast Show w/ Charlie Bones &amp; Mafalda 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/the-do-you-breakfast-show-w-charlie-bones-mafalda-6th-february-2018/" data-permalink="/shows/the-do-you-breakfast-show/episodes/the-do-you-breakfast-show-w-charlie-bones-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/efc43ed2-1945-4039-b8a7-cf74ee65dbee_1517961600.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/efc43ed2-1945-4039-b8a7-cf74ee65dbee_1517961600.jpeg" alt="What Means the World 2 U w/ Amber Mark and Antwon 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/what-means-the-world-2-u-w-amber-mark-and-antwon-5th-february-2018/" data-permalink="/shows/what-means-the-world-2-u/episodes/what-means-the-world-2-u-w-amber-mark-and-antwon-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/ff468d66-b127-49f6-8566-9ba6804d5fa7_1496016000.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/ff468d66-b127-49f6-8566-9ba6804d5fa7_1496016000.jpeg" alt="Gong Sounds w/ PRMTVO 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/gong-sounds-w-prmtvo-5th-february-2018/" data-permalink="/shows/prmtvo/episodes/gong-sounds-w-prmtvo-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/7e201371-1944-4450-b5ce-81a4823fd9b1_1507680000.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/7e201371-1944-4450-b5ce-81a4823fd9b1_1507680000.jpeg" alt="Circle Packing w/ Occo 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/circle-packing-w-occo-5th-february-2018/" data-permalink="/shows/occo/episodes/circle-packing-w-occo-5th-january-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/281ca8dc-fcb1-4761-919e-b36b9f87f964_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/281ca8dc-fcb1-4761-919e-b36b9f87f964_1517875200.jpeg" alt="Torn Hawk 06.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/torn-hawk-6th-february-2018/" data-permalink="/shows/torn-hawk/episodes/torn-hawk-6th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/ec3f0ee3-5e59-4140-a4bb-b25027b2315b_1495670400.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/ec3f0ee3-5e59-4140-a4bb-b25027b2315b_1495670400.jpeg" alt="SON. w/ Black Radical Imagination  05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/son-w-black-radical-imagination-5th-february-2018/" data-permalink="/shows/son/episodes/son-w-black-radical-imagination-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/3cefa9b3-8361-42f0-8cea-653ada93414a_1496016000.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/3cefa9b3-8361-42f0-8cea-653ada93414a_1496016000.jpeg" alt="Barb Wire Halo w/ H0tf1re  05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/barb-wire-halo-w-hotfire-la-5th-february-2018/" data-permalink="/shows/hotfire/episodes/barb-wire-halo-w-h0tf1re-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/dd01d7d2-34d6-48a3-8b13-f8a41f9fea57_1459119600.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/dd01d7d2-34d6-48a3-8b13-f8a41f9fea57_1459119600.jpeg" alt="All Fruits Ripe w/ Jack Sapsed 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/all-fruits-ripe-w-jack-sapsed-5th-february-2018/" data-permalink="/shows/all-fruits-ripe/episodes/all-fruits-ripe-w-jack-sapsed-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/6080d0ef-e889-4c39-9b95-03cf997978f4_1510531200.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/6080d0ef-e889-4c39-9b95-03cf997978f4_1510531200.jpeg" alt="Lucifer Over LA 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/lucifer-over-la-5th-february-2018/" data-permalink="/shows/lucifer-over-london/episodes/lucifer-over-la-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/54c36fcf-8bd1-44c4-8c8f-73ec1d5b1029_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/54c36fcf-8bd1-44c4-8c8f-73ec1d5b1029_1517875200.jpeg" alt="The Synth Hero Show w/ Stephen Morris 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/the-synth-hero-show-w-stephen-morris-5th-february-2018/" data-permalink="/shows/synth-hero-show/episodes/the-synth-hero-show-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/fd32faeb-17d8-445c-8b94-3534fa209aec_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/fd32faeb-17d8-445c-8b94-3534fa209aec_1517875200.jpeg" alt="CDMX Tapes w/ NKC &amp; Fausto Bahía 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/cdmx-tapes-5th-february-2018/" data-permalink="/shows/naafi/episodes/cdmx-tapes-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/0bd67026-f9a1-4afd-9304-2198fa8add38_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/0bd67026-f9a1-4afd-9304-2198fa8add38_1517875200.jpeg" alt="Who's That Girl? - Norma Jean Bell 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/whos-that-girl-5th-february-2018/" data-permalink="/shows/whos-that-girl/episodes/whos-that-girl-w-leyla-pillai-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/7330555e-ef3b-42c5-9d4d-e31d0ace5bdf_1517443200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/7330555e-ef3b-42c5-9d4d-e31d0ace5bdf_1517443200.jpeg" alt="Vlad Dobrovolski 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/vlad-dobrovolski-5th-february-2018/" data-permalink="/shows/guests/episodes/vlad-dobrovolski-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/dd422a1d-30c9-42f8-be16-7eca470f19bf_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/dd422a1d-30c9-42f8-be16-7eca470f19bf_1517875200.jpeg" alt="Hit A Lick Radio 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/hit-a-lick-radio-5th-february-2018/" data-permalink="/shows/hit-a-lick/episodes/hit-a-lick-radio-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/f276d408-1b1f-4d89-88ac-90731e612368_1458000000.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/f276d408-1b1f-4d89-88ac-90731e612368_1458000000.jpeg" alt="Anthony Chalmers 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/anthony-chalmers-5th-february-2018/" data-permalink="/shows/anthonychalmers/episodes/anthony-chalmers-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/6a994899-796f-4d2f-b7d4-3a5c3411424c_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/6a994899-796f-4d2f-b7d4-3a5c3411424c_1517875200.jpeg" alt="Jason Kerley 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/jason-kerley-5th-february-2018/" data-permalink="/shows/joaneskyler/episodes/jason-kerley-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/44683786-cbdd-461c-9db6-afdf7dd7fb08_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/44683786-cbdd-461c-9db6-afdf7dd7fb08_1517875200.jpeg" alt="Radio Jiro w/ Leolyxxx 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/radio-jiro-5th-february-2018/" data-permalink="/shows/radio-jiro/episodes/radio-jiro-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/57b6f721-1d0d-4e17-8db3-e5066460de35_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/57b6f721-1d0d-4e17-8db3-e5066460de35_1517875200.jpeg" alt="Are You Before 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/are-you-before-5th-february-2018/" data-permalink="/shows/are-you-before/episodes/are-you-before-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/d8b93042-13f1-4cda-9790-dd90bb75cec2_1512345600.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/d8b93042-13f1-4cda-9790-dd90bb75cec2_1512345600.jpeg" alt="Lil Mofo 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/lil-mofo-5th-february-2018/" data-permalink="/shows/lil-mofo/episodes/lil-mofo-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/4ad500df-5106-478d-8224-89517a1edacb_1515456000.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/4ad500df-5106-478d-8224-89517a1edacb_1515456000.jpeg" alt="Meuko! Meuko! - none 無 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/meuko-meuko-5th-february-2018/" data-permalink="/shows/meuko-meuko/episodes/meuko-meuko-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/8f27f716-daaf-4251-908d-706febb9d8e8_1458604800.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/8f27f716-daaf-4251-908d-706febb9d8e8_1458604800.jpeg" alt="Patrick Forge 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/patrick-forge-5th-february-2018/" data-permalink="/shows/patrickforge/episodes/patrick-forge-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/9ec8db1a-dd9e-435e-819e-882a8b99f5dc_1517875200.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/9ec8db1a-dd9e-435e-819e-882a8b99f5dc_1517875200.jpeg" alt="Raga Vibrations 05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/raga-vibrations-5th-february-2018/" data-permalink="/shows/raga-vibrations/episodes/raga-vibrations-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/800x800/f5a00d2d-62fc-44d7-b864-96635fabe818_1516665600.jpeg" data-src="https://media2.ntslive.co.uk/resize/800x800/f5a00d2d-62fc-44d7-b864-96635fabe818_1516665600.jpeg" alt="The Do!! You!!! Breakfast Show w/ Charlie Bones &amp; Jack Rollo  05.02.18 Radio Episode"
      class="img preload-img">
      <div class="nts-grid-item__img__overlay">
      <div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/the-do-you-breakfast-show-w-charlie-bones-5th-february-2018/" data-permalink="/shows/the-do-you-breakfast-show/episodes/the-do-you-breakfast-show-w-charlie-bones-5th-february-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span>
      <!-- snip --></div></div></div></div></div>
      <div class="nts-grid-item-container">
      <div class="nts-grid-item">
      <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/ec779695-7b04-4cff-bf57-abcb6edcf244_1492560000.jpeg" data-src="https://media.ntslive.co.uk/resize/800x800/ec779695-7b04-4cff-bf57-abcb6edcf244_1492560000.jpeg" alt="Slime w/ Little 05.02.18 Radio Episode"
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
    Then only new episodes are added to the platform