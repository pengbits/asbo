Feature: Get Media Embed
As a User
In order to play back episodes right in the app
I want to render a media player


@media @soundcloud @embed @success
Scenario: fetch a soundcloud embed
  Given I have a media object
  """
  { "url" : "https://soundcloud.com/rinsefm/theheatwave020518", "type": "soundcloud" }
  """
  When I post the attributes to the media endpoint
  Then I will get this embed back
  """
  <iframe width="100%" height="400" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?visual=true&url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F438267681&show_artwork=true"></iframe>
  """
  
@media @soundcloud @embed @error
Scenario: fetch a foo embed
  Given I have a media object
  """
  {"type":"foo"}
  """
  When I post the attributes to the media endpoint
  Then I will get an error
  
@media @mixcloud @embed @success
Scenario: fetch a mixcloud embed
  Given I have a media object
  """
  { "url" : "https://www.mixcloud.com/NTSRadio/edits-w-kelman-duran-3rd-may-2018/", "type": "mixcloud" }
  """
  When I post the attributes to the media endpoint
  Then I will get this embed back
  """
  <iframe width="100%" height="120" src="https://www.mixcloud.com/widget/iframe/?hide_cover=1&light=1&feed=%2FNTSRadio%2Fedits-w-kelman-duran-3rd-may-2018%2F" frameborder="0" ></iframe>
  """