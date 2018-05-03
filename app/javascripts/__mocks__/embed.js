// http://soundcloud.com/oembed?format=json&url=https://soundcloud.com/rinsefm/theheatwave020518&amp;color=%234274e3&amp;auto_play=false&amp;hide_related=true&amp;show_comments=false&amp;show_user=false&amp;show_reposts=false&amp;show_teaser=true&show_artwork%27);
export const getEmbedFromRemoteAPI = () => {
  return new Promise((resolve,reject) => {
    setTimeout(resolve, 0, {
      "version": 1,
      "type": "rich",
      "provider_name": "SoundCloud",
      "provider_url": "http://soundcloud.com",
      "height": 400,
      "width": "100%",
      "title": "The Heatwave w/ P Money - Wednesday 2nd May 2018 by Rinse FM",
      "description": "",
      "thumbnail_url": "http://i1.sndcdn.com/artworks-000343244331-d3615l-t500x500.jpg",
      "html": "<iframe width=\"100%\" height=\"400\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?visual=true&url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F438267681&show_artwork=true&amp=&color=%234274e3&auto_play=false&hide_related=true&show_comments=false&show_user=false&show_reposts=false&show_teaser=true&show_artwork%27%29=\"></iframe>",
      "author_name": "Rinse FM",
      "author_url": "http://soundcloud.com/rinsefm"
    })
  })
}