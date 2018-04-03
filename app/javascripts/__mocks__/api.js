import platforms from './platforms'
import episodes from './episodes'

const MockAPI = class {
  getPlatforms() {
    console.log(`API.fetch /platforms`)
    return new Promise((resolve,reject) => {
      setTimeout(resolve, 0, platforms)
    })
  }
  
  getPlatform({nickname}){
    console.log(`API.fetch /episodes/${nickname}`)
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
  
  getEpisodes() {
    console.log(`API.fetch /episodes`)
    return new Promise((resolve,reject) => {
      setTimeout(resolve, 0, episodes)
    })
  }
  
  getEpisode({id}) {
    console.log(`/api/episodes/${id}`)
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