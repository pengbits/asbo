// get media embed markup for soundcloud tracks, w/ the oembed api
export const getEmbedFromRemoteAPI = ({type,url}) => {
  if(!type) throw new Error('must provide a type')
  if(type !== 'soundcloud') throw new Error(`${type} is not a supported embed type`)
  if(!url) throw new Error('url not provided')
  
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
 