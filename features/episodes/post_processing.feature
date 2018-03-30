Feature: Post Processing Hooks
As a developer
In order to edit some properties of the episode  
I want to perform post-processing on the episode after it is created

  @episode @images @post-processing
  Scenario: change image dimensions
    Given the platform nickname=nts
    And html for an episode
    """
    <div class="nts-grid-item"><div class="nts-grid-item__img"><img src="https://media2.ntslive.co.uk/resize/100x100/f0cf5a5b-ea8b-4123-ae58-2b72662c6ac8_1522281600.jpeg" data-src="https://media2.ntslive.co.uk/resize/100x100/f0cf5a5b-ea8b-4123-ae58-2b72662c6ac8_1522281600.jpeg" alt="Whits &amp; Giggles w/ Ideal Black Female 29.03.18 Radio Episode"class="img preload-img"><div class="nts-grid-item__img__overlay"><div class="nts-grid-item__img__play-btn mixcloud-btn" data-src="https://www.mixcloud.com/NTSRadio/whits-n-giggles-w-ideal-black-female-28th-march-2018/" data-permalink="/shows/whits-giggles/episodes/whits-n-giggles-w-ideal-black-female-28th-march-2018"><span class="nts-grid-item__img__play-btn__text"><span class="icon icon-play text-bold"></span></span></div></div></div><div class="nts-grid-item__img nts-grid-item__img--link nts-app" data-href="/shows/whits-giggles/episodes/whits-n-giggles-w-ideal-black-female-28th-march-2018"><img src="https://media2.ntslive.co.uk/resize/100x100/f0cf5a5b-ea8b-4123-ae58-2b72662c6ac8_1522281600.jpeg" data-src="https://media2.ntslive.co.uk/resize/100x100/f0cf5a5b-ea8b-4123-ae58-2b72662c6ac8_1522281600.jpeg" alt="Whits &amp; Giggles w/ Ideal Black Female 29.03.18 Radio Episode"class="img preload-img"></div><a href="/shows/whits-giggles/episodes/whits-n-giggles-w-ideal-black-female-28th-march-2018" class="nts-app nts-link nts-link--nohover"><div class="nts-grid-item__header text-bold nts-link nts-link--highlighted"><div class="nts-grid-item__title">Whits &amp; Giggles w/ Ideal Black Female</div><div class="nts-grid-item__subtitle"><p class="nts-grid-item__subtitle__left">29.03.18</p><p class="nts-grid-item__subtitle__right">LA</p></div></div></a>
    </div>
    """

    When I parse the html
    Then the platform will contain an episode with this image 'https://media2.ntslive.co.uk/wibble/800x800/f0cf5a5b-ea8b-4123-ae58-2b72662c6ac8_1522281600.jpeg'
