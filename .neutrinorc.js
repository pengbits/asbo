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
        // this makes index.js loadable on any url, 
        // ie when reloading a page such as /platforms/rinse
        baseHref : '/' 
      },
      devServer : {
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, PATCH, OPTIONS",
          "Access-Control-Request-Method": '*',
          "Access-Control-Allow-Headers": "'Origin, X-Requested-With, Content-Type, Accept, Authorization"
        },
        proxy: {
          "/api": {
            target: "http://localhost:4100",
            pathRewrite: {"^/api" : ""}
          }
        }
      }
    }]
  ]
}