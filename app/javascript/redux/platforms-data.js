export default [{
  "id": 1,
  "name": "nts.live",
  "nickname": "nts",
  "created_at": "2018-02-27T19:10:05.186Z",
  "updated_at": "2018-02-27T19:10:05.186Z",
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
  "has_details": true
}, {
  "id": 2,
  "name": "rinse.fm",
  "nickname": "rinse",
  "created_at": "2018-02-27T19:10:05.190Z",
  "updated_at": "2018-02-27T19:10:05.190Z",
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
  "has_details": false
}, {
  "id": 3,
  "name": "radar radio",
  "nickname": "radar",
  "created_at": "2018-02-27T19:10:05.193Z",
  "updated_at": "2018-02-27T21:50:56.518Z",
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
    "url": "http://www.radarradio.com/wp-admin/admin-ajax.php?action=alm_query_posts\u0026post_type=radarradio_podcasts\u0026posts_per_page=32",
    "param": "pageNumber",
    "itemsPerPage": 32
  },
  "has_details": true
}]