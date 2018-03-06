// .neutrinorc.js
module.exports = {
  options: {
    source: 'app/javascript'
  },
  use: [
    ['@neutrinojs/react', {
      html: {
        title: 'asbo',
        // fix for htmlHistoryFailsafe
        // this makes index.js load on any url, ie for reloading
        baseHref : '/' 
      }
    }]
  ]
}