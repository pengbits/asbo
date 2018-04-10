import platforms from './platforms'
import episodes from './episodes'

// todo
// should we scrap this and the 'real' api class above,
// and just use axios + moxios or similar right in the reducer?
const MockAPI = class {
  getPlatforms() {
    // console.log(`API.fetch /platforms`)
    return new Promise((resolve,reject) => {
      setTimeout(resolve, 0, platforms)
    })
  }
  
  getPlatform({nickname}){
    // console.log(`API.fetch /platforms/${nickname}`)
    const platform = platforms.find(p => p.nickname == nickname)
    return new Promise((resolve,reject) => {
      if(!!platform) {
        setTimeout(resolve, 0, platform)
      } else {
        setTimeout(reject, 0, {
          'error' : `Platform with nickname ${nickname} not found`
        })
      }
    })
  }
  
  // faking the refresh by cherry-picking episodes w/ same id
  // and merging into the platform... this is so different from real implementation
  // that it's only valuable for testing the reducers, not any kind of integration
  // and only good for that as long as the mock api is kept in sync w/ the real thing
  refreshPlatform({nickname}){
    // console.log(`API.fetch /platforms/${nickname}/refresh`)
    const platform = platforms.find(p => p.nickname == nickname)
    return new Promise((resolve,reject) => {
      if(!platform) {
        setTimeout(reject, 0, {
          'error' : `Platform with nickname ${nickname} not found`
        })
      } else {
        const platformEpisodes = episodes.filter(e => e.platform_id == platform.id)
        setTimeout(resolve, 0, {
          ...platform, episodes: platformEpisodes
        })
      }
    })
    
  }
  
  getEpisodes(opts={}) {
    // console.log('API.fetch /episodes' + (!!opts.filter ? `/filter/${opts.filter}` :''))
    return new Promise((resolve,reject) => {
      const results = !!opts.filter ? 
        episodes.filter(e => {
          const isMatch = e.name.toLowerCase().indexOf(opts.filter.toLowerCase()) > -1
          return isMatch
        }) : episodes
      ;
      
      setTimeout(resolve, 0, results)
    })
  }
  
  getEpisode({id}) {
    // console.log(`/api/episodes/${id}`)
    const episode = episodes.find(p => p.id == id)
    return new Promise((resolve,reject) => {
      if(!!episode) {
        setTimeout(resolve, 0, episode)
      } else {
        setTimeout(reject, 0, {
          'error' : `Episode with id ${id} not found`
        })
      }
    })
  }
}
export default new MockAPI()