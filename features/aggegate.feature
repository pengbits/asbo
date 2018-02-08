Feature: Combine episodes from different Platforms 
  As a User
  In order to get more episodes from the same artist or show
  I want to combine episodes from different Platforms
  
  @aggregate
  Scenario: combine episodes from multiple platforms and sort by date
    Given these platforms
    And these episodes
    """
    [{
      "name": "A Fist in the Face of God presents: Midnite Madness 07.02.18 Radio Episode",
      "platform_id": 1,
      "url": "https://www.mixcloud.com/NTSRadio/midnite-madness-7th-february-2018/",
      "image": "https://media3.ntslive.co.uk/resize/100x100/0923de95-b34c-43c2-a583-8814c8401dd5_1432152716.jpg",
      "date": "07.02.18"
    }, {
      "name": "Ossia 06.02.18 Radio Episode",
      "platform_id": 1,
      "url": "https://www.mixcloud.com/NTSRadio/ossia-6th-february-2018/",
      "image": "https://media3.ntslive.co.uk/resize/100x100/7af8497e-cdc1-473f-8416-c53b86ebc79a_1517788800.jpeg",
      "date": "06.02.18"
    }, {
      "name": "Out of Hours w/ Jak Ryan 06.02.18 Radio Episode",
      "platform_id": 1,
      "url": "https://www.mixcloud.com/NTSRadio/out-of-hours-w-jak-ryan-6th-february-2018/",
      "image": "https://media3.ntslive.co.uk/resize/100x100/bdc6ef82-17e5-47e4-9a77-4f6f26efe011_1480636800.jpeg",
      "date": "06.02.18"
    }, {
      "name": "Iona Fortune 06.02.18 Radio Episode",
      "platform_id": 1,
      "url": "https://www.mixcloud.com/NTSRadio/iona-fortune-6th-february-2018/",
      "image": "https://media3.ntslive.co.uk/resize/100x100/ec5df85e-4836-4187-8855-0ed9af1ff3e3_1517788800.jpeg",
      "date": "06.02.18"
    }, {
      "name": "Paradise Bangkok w/ Paul Rekret  06.02.18 Radio Episode",
      "platform_id": 1,
      "url": "https://www.mixcloud.com/NTSRadio/paradise-bangkok-6th-february-2018/",
      "image": "https://media3.ntslive.co.uk/resize/100x100/f8cef156-b532-4fff-b350-ed63ce92ac4c_1517961600.jpeg",
      "date": "06.02.18"
    }, {
      "name": "Cherrystones 06.02.18 Radio Episode",
      "platform_id": 1,
      "url": "https://www.mixcloud.com/NTSRadio/cherrystones-6th-february-2018/",
      "image": "https://media3.ntslive.co.uk/resize/100x100/a519bb56-23c5-4981-a2d3-8c5917d60885_1517961600.jpeg",
      "date": "06.02.18"
    }, {
      "name": "Tuesday Trips w/ Nahhg \u0026 Ewonee 06.02.18 Radio Episode",
      "platform_id": 1,
      "url": "https://www.mixcloud.com/NTSRadio/tuesday-trips-w-nahhg-6th-february-2018/",
      "image": "https://media3.ntslive.co.uk/resize/100x100/c9d07908-f7c6-4f9b-b9c5-2fa0c2c8497e_1517961600.jpeg",
      "date": "06.02.18"
    }, {
      "name": "Mark Leckey 06.02.18 Radio Episode",
      "platform_id": 1,
      "url": "https://www.mixcloud.com/NTSRadio/mark-leckey-6th-february-2018/",
      "image": "https://media3.ntslive.co.uk/resize/100x100/81b6caeb-0909-433d-8631-04eaefe22235_1517961600.jpeg",
      "date": "06.02.18"
    }, {
      "name": "Felix Hall 06.02.18 Radio Episode",
      "platform_id": 1,
      "url": "https://www.mixcloud.com/NTSRadio/felix-hall-6th-february-2018/",
      "image": "https://media3.ntslive.co.uk/resize/100x100/c87748c4-9354-4b16-bf47-c5d0daac36cd_1501113600.jpeg",
      "date": "06.02.18"
    }, {
      "name": "Prosumer \u0026 Kate Harahan 06.02.18 Radio Episode",
      "platform_id": 1,
      "url": "https://www.mixcloud.com/NTSRadio/prosumer-6th-february-2018/",
      "image": "",
      "date": "06.02.18"
    }, {
      "name": "JAYDA G 06.02.18 Radio Episode",
      "platform_id": 1,
      "url": "https://www.mixcloud.com/NTSRadio/jayda-g-6th-february-2018/",
      "image": "",
      "date": "06.02.18"
    }, {
      "name": "Donna Leake 06.02.18 Radio Episode",
      "platform_id": 1,
      "url": "https://www.mixcloud.com/NTSRadio/donna-leake-6th-february-2018/",
      "image": "",
      "date": "06.02.18"
    }, {
      "name": "The Marcus Nasty Show with Zed Bias, Mic Man Frost, Leda Stray \u0026 Beth ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/marcusnasty070218",
      "image": "",
      "date": "2018-02-07"
    }, {
      "name": "Sammy Porter ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/sammyporter070218",
      "image": "",
      "date": "2018-02-07"
    }, {
      "name": "Wes Baggaley with Kate Harahan ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/wesbaggaley070218",
      "image": "",
      "date": "2018-02-07"
    }, {
      "name": "Trends ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/trends060218",
      "image": "",
      "date": "2018-02-07"
    }, {
      "name": "Slimzee w/ Boylan ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/slimzee060218",
      "image": "",
      "date": "2018-02-06"
    }, {
      "name": "Grime Originals with Sharky Major, Spooky, Neeko, Jendor, Ribz, Swarvo, Double S, Mez and Sub Ten ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/grimeoriginals060218",
      "image": "",
      "date": "2018-02-06"
    }, {
      "name": "Joshua James ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/joshuajames060218",
      "image": "",
      "date": "2018-02-06"
    }, {
      "name": "Isaac Reuben ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/isaacreuben060218",
      "image": "",
      "date": "2018-02-06"
    }, {
      "name": "Klose One ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/kloseone060218",
      "image": "",
      "date": "2018-02-06"
    }, {
      "name": "Wes Baggaley ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/wesbaggaley060218",
      "image": "",
      "date": "2018-02-06"
    }, {
      "name": "Yayoyanoh with Wallis Dante and SVO nTheBeat ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/yayoyanoh060218",
      "image": "",
      "date": "2018-02-06"
    }, {
      "name": "Fabio and Grooverider ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/1fabioandgrooverider050218",
      "image": "",
      "date": "2018-02-05"
    }, {
      "name": "Grandmixxer ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/grandmixxer050218",
      "image": "",
      "date": "2018-02-05"
    }, {
      "name": "Crazy Cousinz ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/CrazyCousinz050218",
      "image": "",
      "date": "2018-02-05"
    }, {
      "name": "HAAi ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/haai050218",
      "image": "",
      "date": "2018-02-05"
    }, {
      "name": "Wes Baggaley ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/wesbaggaley050218",
      "image": "",
      "date": "2018-02-05"
    }, {
      "name": "Norwood Soul Patrol ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/norwoodsoulpatrol040218",
      "image": "",
      "date": "2018-02-05"
    }, {
      "name": "Lily Mercer with Capo Lee ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/lilymercer040218",
      "image": "",
      "date": "2018-02-05"
    }, {
      "name": "Huntleys + Palmers with Elliot Adamson, Ally Tropical \u0026 Andrew Thomson ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/huntleyspalmers040218",
      "image": "",
      "date": "2018-02-04"
    }, {
      "name": "DJ Ron \u0026 Jumpin Jack Frost with Cowboy Ras Ranger ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/djron040218",
      "image": "",
      "date": "2018-02-04"
    }, {
      "name": "Rage Radio with Haram, Itsi, Ducky Dynamo, Andre Altrez \u0026 Alli Logout ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/haram040218",
      "image": "",
      "date": "2018-02-04"
    }, {
      "name": "Swamp 81 with Loefah \u0026 Piezo ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/horsemeatdisco040218swamp81",
      "image": "",
      "date": "2018-02-04"
    }, {
      "name": "Neptizzle with Afrokings ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/neptizzle040218",
      "image": "",
      "date": "2018-02-04"
    }, {
      "name": "Horse Meat Disco ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/horsemeatdisco040218",
      "image": "",
      "date": "2018-02-04"
    }, {
      "name": "Josey Rebelle with Jayson Wynters ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/joseyrebelle040218",
      "image": "",
      "date": "2018-02-04"
    }, {
      "name": "Able ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/able040218",
      "image": "",
      "date": "2018-02-04"
    }, {
      "name": "Manni Dee ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/mannidee030218",
      "image": "",
      "date": "2018-02-04"
    }, {
      "name": "Robert Johnson Takeover: Carl Simon  ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/carlsimon030218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Robert Johnson Takeover: DJ Neewt ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/djneewt030218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Robert Johnson Takeover: Koloman Trax ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/kolomantrax030218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Robert Johnson Takeover: Kilian Paterson ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/kilianpaterson030218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Robert Johnson Takeover: Paramida ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/paramida030218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Robert Johnson Takeover: Phil Evans ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/philevans030218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Robert Johnson Takeover: Bodin \u0026 Jacob ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/bodinjacob030218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Robert Johnson Takeover: Aziesch ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/aziesch030218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Robert Johnson Takeover: Vincent Feit ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/vincentfeit030218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Robert Johnson Takeover: Max Best ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/maxbest030218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Robert Johnson Takeover: Benjamin Milz ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/benjaminmilz030218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Robert Johnson Takeover: Orson Wells ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/orsonwells030218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Jyoty ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/jyoty030218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Dappa with MARTS ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/dappa030218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Mak \u0026 Pasteman with Troy Gunner ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/makandpasteman020218",
      "image": "",
      "date": "2018-02-03"
    }, {
      "name": "Friday Night with Tijana T ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/tijanat020218",
      "image": "",
      "date": "2018-02-02"
    }, {
      "name": "The UK Rap Show with Morgan Keyz ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/morgankeyz020218",
      "image": "",
      "date": "2018-02-02"
    }, {
      "name": "Lobster Theremin with Asquith ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/lobstertheremin020218",
      "image": "",
      "date": "2018-02-02"
    }, {
      "name": "The Heatwave with Shauna Shadae and Stylo G ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/theheatwave020218",
      "image": "",
      "date": "2018-02-02"
    }, {
      "name": "Sam Supplier  ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/samsupplier020218",
      "image": "",
      "date": "2018-02-02"
    }, {
      "name": "Uncle Dugs ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/uncledugs020218",
      "image": "",
      "date": "2018-02-02"
    }, {
      "name": "Alia Loren ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/aliaLoren020218",
      "image": "",
      "date": "2018-02-02"
    }, {
      "name": "J Kenzo ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/jkenzo010218",
      "image": "",
      "date": "2018-02-02"
    }, {
      "name": "Fuse with Rich NXT ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/fuse010218",
      "image": "",
      "date": "2018-02-01"
    }, {
      "name": "Hessle Audio w/ Ben UFO \u0026 Hadj Sameer ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/hessleaudio010218",
      "image": "",
      "date": "2018-02-01"
    }, {
      "name": "Jane Fitz ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/janefitz010218",
      "image": "",
      "date": "2018-02-01"
    }, {
      "name": "Big Tobz \u0026 Friends ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/bigtobz010218",
      "image": "",
      "date": "2018-02-01"
    }, {
      "name": "Wes Baggaley ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/wesbaggaley010218",
      "image": "",
      "date": "2018-02-01"
    }, {
      "name": "Alia Loren with K4cie ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/alialoren010218",
      "image": "",
      "date": "2018-02-01"
    }, {
      "name": "Rupture (Oldskool Set) with Double O \u0026 Mantra ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/rupture310118",
      "image": "",
      "date": "2018-02-01"
    }, {
      "name": "Ploy ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/ploy310118",
      "image": "",
      "date": "2018-01-31"
    }, {
      "name": "Grime Orginals w/ Rapid b2b Scholar, Sharky Major, Roachee, Fuda Guy, So Large, Discarda, Villain \u0026 Royal ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/grimeoriginals310118",
      "image": "",
      "date": "2018-01-31"
    }, {
      "name": "The Marcus Nasty Show w/ FOOR, Dizzle Kid, Grandmixxer, DevilMan, TYKE (playaz) \u0026 MC Nutcracka ",
      "platform_id": 2,
      "url": "https://soundcloud.com/rinsefm/marcusnasty310118",
      "image": "",
      "date": "2018-01-31"
    }]
    """
    When I view list sorted by date
    Then the list should include episodes from both rinse and nts