import platforms from './platforms'
import embed from './embed'
import episodes, {pagedEpisodesForPlatform,forPlatform} from './episodes'

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
        setTimeout(resolve, 0, {
          ...platform,
          episodes: pagedEpisodesForPlatform({nickname})
        })
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
  refreshPlatform({nickname,filter,page}){
    console.log(`API.fetch /platforms/${nickname}/refresh ${JSON.stringify({filter,page})}`);
    const platform = platforms.find(p => p.nickname == nickname)
    return new Promise((resolve,reject) => {
      if(!platform) {
        setTimeout(reject, 0, {
          'error' : `Platform with nickname ${nickname} not found`
        })
      } else {
        const matches = pagedEpisodesForPlatform({nickname,page}).filter(e => this.isMatchingEpisode(e, filter))
        setTimeout(resolve, 0, {
          ...platform, episodes: matches
        })
      }
    })
    
  }
  
  getEpisodes(opts={}) {
    // console.log('API.fetch /episodes' + (!!opts.filter ? `/filter/${opts.filter}` :''))
    return new Promise((resolve,reject) => {
      setTimeout(resolve, 0, this.filteredEpisodes(opts))
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
  
  getMediaEmbed({type,url}){
    const valid_types = ['soundcloud','mixcloud']
    return new Promise((resolve,reject) => {
      if(!!type && valid_types.includes(type) && !!url){
        setTimeout(resolve, 0, embed[type])
      } else {
        setTimeout(reject, 0, {'error':'must provide valid type and url'})
      }
    })
  }
  
  private
  
  filteredEpisodes({filter}) {
    return episodes.filter(e => this.isMatchingEpisode(e, filter))
  }
  
  isMatchingEpisode(episode, filter) {
    return !filter || episode.name.toLowerCase().indexOf(filter.toLowerCase()) > -1
  }
}
export default new MockAPI()