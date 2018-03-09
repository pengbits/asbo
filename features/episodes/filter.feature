Feature: Filter Episodes
   In order to reduce a large collection of podcast episodes on an external platform (in html format)
   to a manageable list suitable for consumption by a local app (in JSON format)
   I want to reduce them to a subset and coerce into JSON/RSS
  
@filter
Scenario: filter episodes by a search term
  Given the platform nickname=nts
    And episodes
      |date_str|name|media|image|
      |01.02.18|From Sun City w/ Ukudada 01.02.18 Radio Episode|/shows/from-sun-city/episodes/from-sun-city-1st-february-2018|https:\/\/media.ntslive.co.uk/resize/800x800/8733c632-7e4d-4691-8220-1065a319fa77_1493251200.jpeg|
      |01.02.18|Videogamemusic w/ Bugbuspiano 01.02.18 Radio Episode|/shows/videogamemusic/episodes/videogamemusic-1st-february-2018|https:\/\/media.ntslive.co.uk/resize/800x800/9a64e816-8ab9-4490-a914-66b74e3a58c8_1458086400.jpeg|
      |31.01.18|The NCA Show w/ Brassfoot 31.01.18 Radio Episode|/shows/brassfoot/episodes/the-nca-show-w-brassfoot-31st-january-2018|https:\/\/media2.ntslive.co.uk/resize/800x800/020d1450-f8f1-4541-ac29-925f829cf03f_1517443200.jpeg|
      |31.01.18|Funkineven Presents: The Apron Show 31.01.18 Radio Episode|/shows/funkineven/episodes/funkineven-presents-the-apron-show-31st-january-2018|https:\/\/media2.ntslive.co.uk/resize/800x800/3942775c-2de8-4244-8159-fe057a158cb0_1517443200.jpeg|
      |31.01.18|Cooking w/ Palms Trax 31.01.18 Radio Episode|/shows/palms-trax/episodes/cooking-w-palms-trax-31st-january-18|https:\/\/media2.ntslive.co.uk/resize/800x800/a3ee2975-f9de-4a6a-be13-61be9fc6750e_1517443200.jpeg|
      |31.01.18|Homeshake 31.01.18 Radio Episode|/shows/homeshake/episodes/homeshake-31st-january-2018|https:\/\/media.ntslive.co.uk/resize/800x800/b48164c8-6a29-4404-ad0c-431eee21b146_1471910400.png|
      |31.01.18|Okonkole Y Trompa  31.01.18 Radio Episode|/shows/okonkole-y-trompa/episodes/okonkole-y-trompa-31st-january-2018|https:\/\/media2.ntslive.co.uk/resize/800x800/7ede5f1d-a1d0-4408-bde3-6f32a7ee5918_1517443200.jpeg|
      |31.01.18|Murlo 31.01.18 Radio Episode|/shows/murlo/episodes/murlo-31st-january-2018|https:\/\/media.ntslive.co.uk/resize/800x800/24463c4a-6d6d-48d7-9026-62c9af3b996f_1456963200.jpeg|
      |31.01.18|Bleep w/ Paper Dollhouse 31.01.18 Radio Episode|/shows/bleep/episodes/bleep-31st-january-2018|https:\/\/media2.ntslive.co.uk/resize/800x800/96368982-8784-4a86-8b18-73b83a1556ba_1517443200.jpeg|
      |31.01.18|Moxie & Louisahhh 31.01.18 Radio Episode|/shows/moxie/episodes/moxie-31st-january-2018|https:\/\/media2.ntslive.co.uk/resize/800x800/a7af795f-68cf-474c-83b1-3ed62585c9c5_1517443200.jpeg|
      |31.01.18|PLZ Make It Ruins w/ Vegyn, Roof Access, Stephane & Louis Culture 31.01.18 Radio Episode|/shows/plz-make-it-ruins-w-vegyn/episodes/plz-make-it-ruins-w-vegyn-31st-january-2018|https:\/\/media2.ntslive.co.uk/resize/800x800/6aca07d8-50cb-4a2f-90d1-1269749ea713_1517443200.jpeg|
      |31.01.18|Mosca & Giant Swan 31.01.18 Radio Episode|/shows/mosca/episodes/mosca-30th-january-2018|https:\/\/media.ntslive.co.uk/resize/800x800/73a264a1-9ee3-46b1-8dd3-2163dac6e1c6_1457222400.jpeg|
    
    And a search term: 'murlo'
   When I view the platform's episodes_with_name_matching property
   Then it should include some episodes with the search term in their name