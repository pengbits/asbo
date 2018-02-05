Feature: Store scraping rules in platform
  In order to avoid writing redundant selector/scraper code in each platform
  I want to abstract the rules into an attribute map
  And share the implementation across different platforms

  @attr
  Scenario: NTS and Rinse have different markup, same content model
    Given this attribute map for the platform
      """
        "id": "1",
        "name": "nts.live",
        "attribute_map": {
          "item" : ".nts-grid-item",
          "name" : ".nts-grid-item__img img[alt]",
          "image": ".nts-grid-item__img img[src]",
          "url"  : ".nts-grid-item__img__play-btn[data-src]",
          "date" : ".nts-grid-item__subtitle__left"
        }
      """
    And this html
      """
      <div class="nts-grid-item">
        <div class="nts-grid-item__img"><img src="https://media.ntslive.co.uk/resize/800x800/24463c4a-6d6d-48d7-9026-62c9af3b996f_1456963200.jpeg" 
          data-src="https://media.ntslive.co.uk/resize/800x800/24463c4a-6d6d-48d7-9026-62c9af3b996f_1456963200.jpeg" alt="Murlo 31.01.18 Radio Episode">
        <!-- snip -->
        <a href="/shows/murlo/episodes/murlo-31st-january-2018" class="nts-app nts-link nts-link--nohover">
          <div class="nts-grid-item__header text-bold nts-link nts-link--highlighted">
            <div class="nts-grid-item__title">Murlo</div>
            <div class="nts-grid-item__subtitle">
              <p class="nts-grid-item__subtitle__left">31.01.18</p>
              <p class="nts-grid-item__subtitle__right">LDN</p>
            </div>
          </div>
        </a>
        <!-- snip -->
        <button class="nts-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/murlo-31st-february-2018/" data-permalink="/shows/murlo/episodes/murlo-31st-january-2018"><span class="icon icon-play text-bold"></span></button> <a class="nts-app nts-btn" href="/shows/murlo/episodes/murlo-31st-january-2018">TRACKLIST</a></div>
      </div>
      """
    When i call to_episode on the platform
    Then I should get an episode with these attributes:
       """
       {
         "name":"Murlo 31.01.18 Radio Episode",
         "image":"https://media.ntslive.co.uk/resize/800x800/24463c4a-6d6d-48d7-9026-62c9af3b996f_1456963200.jpeg",
         "date":"31.01.18",
         "url":"https://www.mixcloud.com/NTSRadio/murlo-31st-february-2018/"
       }
       """