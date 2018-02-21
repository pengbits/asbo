# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Platform.destroy_all
Platform.create!({
  id: "1",
  name: "nts.live",
  key: "nts",
  url: "https://www.nts.live/recently-added",
  date_format: "%d.%m.%y",
  attr_map: {
    "item"      => ".nts-grid-item",
    "name"      => ".nts-grid-item__img img[alt]",
    "image"     => ".nts-grid-item__img img[src]",
    "url"       => ".nts-grid-item__img__play-btn[data-src]",
    "date_str"  => ".nts-grid-item__subtitle__left"
  },
  pagination: {    
    "url"          => "/page/:page",
    "itemsPerPage" => 12
  }
})

Platform.create!({
  id: "2",
  name: "rinse.fm",
  key: "rinse",
  url: "http://rinse.fm/podcasts",
  date_format: "%Y-%m-%d",
  attr_map: {
    "item"      => ".podcast-list-item",
    "name"      => "h3",
    "image"     => ".listen.soundcloud a[data-img=src]",
    "url"       => ".listen.soundcloud a[href]",
    "date_str"  => ".listen.soundcloud a[data-air-day]"
  },
  pagination: {    
    "param"        => "page",
    "itemsPerPage" => 60
  }
})


Platform.create!({
    id: "3",
    name: "radar radio",
    key: "radar",
    url: "http://www.radarradio.com/podcasts",
    date_format: "%e %b",
    attr_map: {
      "item"      => ".latestarticle.radarradio_podcasts",
      "name"      => "h2[split(' – ',0)]",
      "image"     => "img[src]",
      "url"       => ".radarradio_podcasts_listen_button a[href]",
      "date_str"  => "h2[split(' – ',1)]"
    },
    pagination: {
      "url" => "http://www.radarradio.com/wp-admin/admin-ajax.php?action=alm_query_posts&post_type=radarradio_podcasts&posts_per_page=16",
      "param" => "pageNumber",
      "itemsPerPage" => 16
    }
  })