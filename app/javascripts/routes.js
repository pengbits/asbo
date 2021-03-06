import * as p from './redux/platforms'
import PlatformList from './containers/PlatformList'
import PlatformDetails from './containers/PlatformDetails'
import PlatformForm from './containers/PlatformForm'

import * as e from './redux/episodes'
import EpisodeList from './containers/EpisodeList'
import EpisodeDetails from './containers/EpisodeDetails'

import Media from './containers/Media'
let map = {}

map[p.LOAD_PLATFORMS]  = {
  component : PlatformList,
  regex     : /platforms$/
}

map[p.LOAD_PLATFORM]   = {
  component : PlatformDetails,
  regex     : /platforms\/(.+)/,
  params    : {'nickname' : 1}
}

map[p.NEW_PLATFORM]   = {
  component : PlatformForm,
  regex     : /platforms\/new/
}

map[p.EDIT_PLATFORM]   = {
  component : PlatformForm,
  regex     : /platforms\/(.+)\/edit/,
  params    : {'nickname' : 1}
}

map[e.LOAD_EPISODES] = {
  component : EpisodeList,
  regex     : /episodes$/
}

map[e.LOAD_EPISODE] = {
  component : EpisodeDetails,
  secondary : Media,
  regex     : /episodes\/(.+)$/,
  params    : { 'id' : 1}
}

const routes = {
  map,
  
  'regex' :(action => {
    return map[action].regex
  }),
  
  'test' : ((path, action) => {
    const isMatch = map[action].regex.test(path)
    // console.log(`routes#test '${path}' =~ '${map[action].regex}' ${isMatch}`)
    return isMatch
  }),
  
  'params' : ((path, action, param) => {
    const cfg = map[action].params || {}
    if(cfg[param] !== undefined){
      return  map[action].regex.exec(path)[cfg[param]]
    } else {
      return {}
    }
  }),
  
  'component':((action, opts={}) => {
    if(!map[action]) {
      throw new Error(`could not map '${action}' to component`)
    } else {
      const k = opts.secondary ? 'secondary' : 'component'
      return map[action][k]
    }
  })
}

export default routes