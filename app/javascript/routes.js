import * as p from './redux/platforms'
import PlatformList from './containers/PlatformList'
import PlatformDetails from './containers/PlatformDetails'
import PlatformForm from './containers/PlatformForm'


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

const routes = {
  map,
  
  'regex' :(action => {
    return map[action].regex
  }),
  
  'test' : ((path, action) => {
    const isMatch = map[action].regex.test(path)
    console.log(`routes#test ${path}?${action} ${isMatch}`)
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
  
  'component':(action => {
    if(!map[action]) throw new Error(`could not map '${action}' to component`)
    console.log(map[action].component)
    return map[action].component
  })
}

export default routes