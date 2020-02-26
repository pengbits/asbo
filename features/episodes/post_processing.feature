Feature: Post Processing Hooks
As a developer
In order to edit some properties of the episode  
I want to perform post-processing on the episode after it is created

  @episode @images @post-processing
  Scenario: change image dimensions
    Given the platform nickname=nts
    And html for an episode
    """
    <article class="nts-grid-v2-item"><div class="nts-grid-v2-item__content"><div class="nts-grid-picture"><img class="nts-grid-picture__img preload-img" alt="Hit A Lick Radio" src="https://media2.ntslive.co.uk/resize/100x100/2fa12bb5-b8a3-4984-9d79-d5f102ae3005_1571097600.png"data-src="https://media2.ntslive.co.uk/resize/800x800/2fa12bb5-b8a3-4984-9d79-d5f102ae3005_1571097600.png"><div role="button" tabindex="0" class="nts-grid-picture__overlay mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/hit-a-lick-14th-october-2019/"data-permalink="/shows/hit-a-lick/episodes/hit-a-lick-radio-14th-october-2019">&nbsp;</div></div><a class="nts-grid-v2-item__header nts-app" href="/shows/hit-a-lick/episodes/hit-a-lick-radio-14th-october-2019" data-track="event" data-category="Navigation" data-action="GoTo-Episode" data-label="from-gridItemTitle"><span>14.10.19</span><span>PHI</span><div class="nts-grid-v2-item__header__title">Hit A Lick Radio</div></a></div>
    </article>  
    """

    When I parse the html
    Then the platform will contain an episode with this image 'https://media2.ntslive.co.uk/resize/800x800/2fa12bb5-b8a3-4984-9d79-d5f102ae3005_1571097600.png'
