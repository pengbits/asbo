
// todo
// should we scrap this and the mock api class at __mocks__/api,
// and just use axios + moxios or similar right in the reducer?

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
  
  getMediaEmbed({url,type}){
    if(!type) throw new Error('must provide a type')
    if(!['soundcloud','mixcloud'].includes(type)) throw new Error(`${type} is not a supported embed type`)
    if(!url) throw new Error('url not provided')

    console.log(`API get /api/media`)
    return fetch('/api/media', {
      method: 'POST',
      headers: {'Content-Type':'application/json'},
      body: JSON.stringify({'media': {type,url}})
    })
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

  // in the real api, filter is passed to backend so repsonse contains a sub-set of total items..
  // in the mock api, the filter is just post-processing in the callback
  refreshPlatform({nickname,filter,page}){
    const base = this.url({nickname})
    const url  = `${base}/refresh/page/` + (page || 1) + (!!filter ? `?filter=${filter}` : '')

    console.log(`API GET ${url}`)
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
        // return new Promise((resolve) => {
        //   setTimeout(resolve, 2000, json)
        // })
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
    
  destroyPlatform({nickname}){
    if(!nickname) throw new Error('must provide a nickname to destroy')
    const url = this.url({nickname})
    console.log(`API delete ${url}`)

    return fetch(url, {
      method: "DELETE"
    })
  }
  
  deleteEpisodes({nickname}){
    if(!nickname) throw new Error('must provide a nickname to delere episodes')
    const url = this.url({nickname}) + '/episodes'
    
    console.log(`API delete ${url}`)

    return fetch(url, {
      method: "DELETE"
    })
  }
  
  // this isn't scaling well!
  url(opts={}){
    const kind = opts.kind || 'platform'
    let urlStr = `/api/${kind}s`
    
    if(kind == 'platform' && opts.nickname) {
      urlStr += `/${opts.nickname}` 
    }
    
    if(kind == 'platform' && opts.page){
      urlStr += `/page/${opts.page}`
    }
    
    if(kind == 'episode' && opts.filter) {
      urlStr += `/filter/${opts.filter}`
    }
    return urlStr
  }  
}

export default new API()