Feature: Get Media Embed
As a User
In order to play back episodes right in the app
I want to render a media player


@media @soundcloud @embed
Scenario: fetch a soundcloud embed
  Given I have a media object with a url and a valid type
  When I post the attributes to the media endpoint
  Then I will get an embed back