
class API {
  getPlatforms(){
    return this.get()
  }
  
  getPlatform(opts={}){
    return this.get(opts)
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
  
  createPlatform(attrs){
    const url = this.url({})
    console.log(`API post ${url}`)
    console.log(`API create => in\n ${JSON.stringify({'platform': attrs})}`)
    
    return fetch(url, {
      method: 'POST',
      headers: {'Content-Type':'application/json'},
      body: JSON.stringify({'platform': attrs})
   })
  }
  
  updatePlatform(attrs){
    const url = this.url(attrs)
    console.log(`API put ${url}`)
    console.log(`API update => in\n ${JSON.stringify({'platform': attrs})}`)
    
    return fetch(url, {
      method: 'PUT',
      headers: {'Content-Type':'application/json'},
      body: JSON.stringify({'platform': attrs})
    }).then(response => {
      if(response.ok){
        return response.json()
      } else {
        throw new Error(response.statusText)
      }
    }).then(function(json){
      console.log(`API update => out\n ${JSON.stringify(json)}`)
      return json
    })
  }
    
  destroyPlatform(opts={}){
    if(!opts.nickname) throw new Error('must provide a nickname to destroy')
    const url = this.url(opts)
    console.log(`API delete ${url}`)

    return fetch(url, {
      method: "DELETE"
    })
  }
  
  
  
  url(opts={}){
    return opts.nickname ? `/api/platforms/${opts.nickname}` : `/api/platforms`
  }  
}

export default new API()