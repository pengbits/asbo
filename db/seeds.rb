# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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
  }
})