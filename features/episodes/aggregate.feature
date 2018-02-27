Feature: Combine episodes from different Platforms 
As a User
In order to get more episodes from the same artist or show
I want to combine episodes from different Platforms

Background: 
  Given these platforms
  And these episodes
  """
  [{
    "name": "A Fist in the Face of God presents: Midnite Madness 07.02.18 Radio Episode",
    "platform_id": 1,
    "media": {"type":"mixcloud", "url":"http://www.mixcloud.com/NTSRadio/midnite-madness-7th-february-2018/"},
    "image": "https://media3.ntslive.co.uk/resize/100x100/0923de95-b34c-43c2-a583-8814c8401dd5_1432152716.jpg",
    "date_str": "07.02.18"
  }, {
    "name": "Ossia 06.02.18 Radio Episode",
    "platform_id": 1,
    "media": {"type":"mixcloud", "url":"http://www.mixcloud.com/NTSRadio/ossia-6th-february-2018/"},
    "image": "https://media3.ntslive.co.uk/resize/100x100/7af8497e-cdc1-473f-8416-c53b86ebc79a_1517788800.jpeg",
    "date_str": "06.02.18"
  }, {
    "name": "Out of Hours w/ Jak Ryan 06.02.18 Radio Episode",
    "platform_id": 1,
    "media": {"type":"mixcloud", "url":"http://www.mixcloud.com/NTSRadio/out-of-hours-w-jak-ryan-6th-february-2018/"},
    "image": "https://media3.ntslive.co.uk/resize/100x100/bdc6ef82-17e5-47e4-9a77-4f6f26efe011_1480636800.jpeg",
    "date_str": "06.02.18"
  }, {
    "name": "The Marcus Nasty Show with Zed Bias, Mic Man Frost, Leda Stray \u0026 Beth, Ossia ",
    "platform_id": 2,
    "media": {"type":"soundcloud", "url":"https://soundcloud.com/rinsefm/marcusnasty070218"},
    "image": "",
    "date_str": "2018-02-07"
  }, {
    "name": "Sammy Porter ",
    "platform_id": 2,
    "media": {"type":"soundcloud", "url":"https://soundcloud.com/rinsefm/sammyporter070218"},
    "image": "",
    "date_str": "2018-02-07"
  }, {
    "name": "Wes Baggaley with Kate Harahan ",
    "platform_id": 2,
    "media": {"type":"soundcloud", "url":"https://soundcloud.com/rinsefm/wesbaggaley070218"},
    "image": "",
    "date_str": "2018-02-07"
  }]
  """
@aggregate @episode
Scenario: episodes index includes content from multiple platforms  
  When I visit the episodes index
  Then the list should include episodes from both rinse and nts

  
@aggregate @episode @filter
Scenario: episodes index accepts a filter param  
  When I visit the episodes index with filter 'ossia'
  Then the list should include episodes with 'ossia' in the name

  