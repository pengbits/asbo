import * as p from './redux/platforms'
let map = {}
// map action constants to regex patterns to test with
map[p.LOAD_PLATFORMS]  = {
  regex:  /platforms$/,
}

map[p.LOAD_PLATFORM]   = {
  regex: /platforms\/(.+)/,
  params: {
    'nickname' : 1
  }
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
    paramConfig = map[action].params || {}
    if(paramConfig[param]){
      index = paramConfig[param]
      return  map[action].regex.exec(path)[index]
    } else {
      return {}
    }
  })
}

export default routes