import * as p from './redux/platforms'
import PlatformList from './containers/PlatformList'
import PlatformDetails from './containers/PlatformDetails'

let map = {}
// map action constants to regex patterns to test with
map[p.LOAD_PLATFORMS]  = {
  component : PlatformList,
  regex     : /platforms$/
}

map[p.LOAD_PLATFORM]   = {
  component : PlatformDetails,
  regex     : /platforms\/(.+)/,
  params    : {'nickname' : 1}
}

const routes = {
  map,
  'regex' :(action => {
    return map[action].regex
  }),
  'test' : ((path, action) => {
    return map[action].regex.test(path)
  }),
  'params' : ((path, action, param) => {
    const cfg = map[action].params || {}
    if(cfg[param]){
      return  map[action].regex.exec(path)[cfg[param]]
    } else {
      return {}
    }
  }),
  'component':(action => {
    if(!map[action]) throw new Error(`could not map '${action}' to component`)
    return map[action].component
  })
}

export default routes