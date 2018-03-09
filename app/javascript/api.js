
class API {
  getPlatforms(){
    return this.get()
  }
  
  getPlatform(opts={}){
    return this.get(opts)
  }
  
  createPlatform(attrs){
    const url = this.url()
    console.log(`API post ${url}`)
    console.log(`    body ${JSON.stringify(attrs)}`)

    return fetch(url, {
      method: 'POST',
      headers: {
       'Content-Type':'application/json',
     },
     body: JSON.stringify(attrs)
   })
  }
  
  get(opts={}){
    const url = this.url(opts)
    console.log(`API get ${url}`)
    return fetch(url)
      .then(response => {
        if(response.ok){
          return response.json()
        } else {
          throw new Error(response.statusText)
        }
      }).then(function(json){
        return json
      })
  }
  
  url(opts={}){
    return opts.nickname ? `/api/platforms/${opts.nickname}` : `/api/platforms`
  }
  
}

export default new API()