export default [{
  "id": 1,
  "name": "nts.live",
  "created_at": "2018-03-30T15:55:39.120Z",
  "updated_at": "2018-03-30T16:25:35.013Z",
  "attr_map": {
    "item": ".nts-grid-item",
    "name": ".nts-grid-item__img img[alt]",
    "image": ".nts-grid-item__img img[src]",
    "media": ".nts-grid-item__img__play-btn[data-src]",
    "details": ".nts-grid-item__img__play-btn[data-permalink]",
    "date_str": ".nts-grid-item__subtitle__left"
  },
  "url": "https://www.nts.live/recently-added",
  "date_format": "%d.%m.%y",
  "pagination": {
    "route": "/page/:page",
    "itemsPerPage": 12
  },
  "has_details": true,
  "nickname": "nts",
  "use_relative_images": false,
  "default_image": "https://dunked.cdn.speedyrails.net/assets/prod/106247/900x0_p1b3tcthu6a28n4p1k7q8hr1ff9t.jpg",
  "post_processing_rules": [{
    "name": "image",
    "gsub": [
      "100x100",
      "800x800"
    ]
  }]
},
{
  "id": 2,
  "name": "rinse.fm",
  "created_at": "2018-03-30T15:55:39.124Z",
  "updated_at": "2018-03-30T15:55:39.124Z",
  "attr_map": {
    "item": ".podcast-list-item",
    "name": "h3",
    "image": ".listen.soundcloud a[data-img-src]",
    "media": ".listen.soundcloud a[href]",
    "date_str": ".listen.soundcloud a[data-air-day]"
  },
  "url": "http://rinse.fm/podcasts",
  "date_format": "%Y-%m-%d",
  "pagination": {
    "param": "page",
    "itemsPerPage": 60
  },
  "has_details": false,
  "nickname": "rinse",
  "use_relative_images": false,
  "default_image": "https://etc.levels.io/rinse-fm/logo.png",
  "post_processing_rules": null
}, {
  "id": 3,
  "name": "radar radio",
  "created_at": "2018-03-30T15:55:39.128Z",
  "updated_at": "2018-03-30T15:55:39.128Z",
  "attr_map": {
    "item": ".latestarticle.radarradio_podcasts",
    "name": "h2[split(' – ',0)]",
    "image": "img[src]",
    "details": ".radarradio_podcasts_listen_button a[href]",
    "date_str": "h2[split(' – ',1)]"
  },
  "url": "http://www.radarradio.com/podcasts",
  "date_format": "%e %b",
  "pagination": {
    "url": "http://www.radarradio.com/wp-admin/admin-ajax.php?action=alm_query_posts&post_type=radarradio_podcasts&posts_per_page=32",
    "param": "pageNumber",
    "itemsPerPage": 32
  },
  "has_details": true,
  "nickname": "radar",
  "use_relative_images": true,
  "default_image": null,
  "post_processing_rules": null
}]