class API {
  getPlatforms(){
    return this.get()
  }
  
  getPlatform(opts={}){
    return this.get(opts)
  }
  
  getEpisodes(opts={}){
    return this.get(Object.assign({}, opts, {kind:'episode'}))
  }
  
  getEpisode({id}){
    if(id !== undefined){
      const url = `/api/episodes/${id}`
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
    else {
      throw new Error('API#getEpisode called without id')
    }
  }
  
  
  refreshPlatform({nickname}){
    const base = this.url({nickname})
    const url  = `${base}/refresh`
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
  
  // this isn't scaling well!
  url(opts={}){
    const kind = opts.kind || 'platform'
    let urlStr = `/api/${kind}s`
    
    if(opts.nickname && opts.kind == 'platform') {
      urlStr += `/${opts.nickname}` 
    }
    
    if(opts.filter && opts.kind == 'episode') {
      urlStr += `/filter/${opts.filter}`
    }
    return urlStr
  }  
}

export default new API()