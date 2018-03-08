
class API {
  getPlatforms(){
    return this.get()
  }
  
  getPlatform(opts={}){
    return this.get(opts)
  }
  
  get(opts={}){
    const url = opts.nickname ? `/api/platforms/${opts.nickname}` : `/api/platforms`
    console.log(`API fetch ${url}`)
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
}

export default new API()