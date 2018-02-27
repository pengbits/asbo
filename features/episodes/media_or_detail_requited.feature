Feature: Media
As a User
In order to ensure integrity of episodes
I want to make either media or details properties required

# @media @details @validation
Scenario: save an episode with media and details
  Given the platform key=nts
  Given the episode attributes
  """
  {
    "name": "Expansions w/ Contours & Yadava 24.02.18 Radio Episode",
    "platform_id": 1,
    "image": "https://media3.ntslive.co.uk/resize/100x100/6933eb93-5a8b-4dd5-b99c-85509d6e6a33_1519430400.jpeg",
    "date_str": "24.02.18",
    "details": "/shows/expansions-w-contours/episodes/expansions-w-contours-yadava-24th-february-2018",
    "media": {
      "type": "mixcloud",
      "url": "https://www.mixcloud.com/NTSRadio/expansions-w-contours-yadava-24th-february-2018/"
    }
  }
  """
  When I save the episode
  Then it should save sucessfully

# @media @details @validation
Scenario: save an episode with details only
  Given the platform key=radar
  Given the episode attributes
  """
  {
    "name": "Sert One [Meine Nacht Takeover]",
    "platform_id": 3,
    "details": "/podcasts/sert-one-meine-nacht-takeover-25th-feb",
    "image": "/wp-content/uploads/2018/02/sert-one.jpg",
    "date_str": "26 Feb",
    "details": "/podcasts/sert-one-meine-nacht-takeover-25th-feb"
  }
  """
  When I save the episode
  Then it should save sucessfully
  
  
@media @details @validation
Scenario: save an episode with no details or media
  Given the platform key=radar
  Given the episode attributes
  """
  {
    "name": "Sert One [Meine Nacht Takeover]",
    "platform_id": 3,
    "image": "/wp-content/uploads/2018/02/sert-one.jpg",
    "date_str": "26 Feb"
  }
  """
  When I save the episode
  Then it should fail validation
