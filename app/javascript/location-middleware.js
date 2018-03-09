import {push} from 'react-router-redux'
import routes from './routes'
import {
  LOAD_PLATFORMS,
  loadPlatforms,
  LOAD_PLATFORM,
  loadPlatform
} from './redux/platforms'

const LocationMiddleware = store => next => action => {
  // dispatch the action after a tiny delay, ie on next render
  // const deferredDispatch = (action, delay=0) => {
  //   return setTimeout(() => store.dispatch(action), delay)
  // }
  if(typeof action =='object'){ // not true of thunks, they'll be functions
    if(action.type == '@@router/LOCATION_CHANGE'){
      
      // @todo extract these regexs into some kidn of map,
      // ideally one that could be exposed to the <route> composition on index.js
      const actionPath  = (action.payload || {}).pathname.replace(/\/$/,'')
        switch(true) {
          case routes[LOAD_PLATFORMS].test(actionPath):
            store.dispatch(loadPlatforms())
            break
          
          // converting to async fetch
          case routes[LOAD_PLATFORM].test(actionPath):
            store.dispatch(loadPlatform({
              // this is fairly cryptic now that regex is moved to routes.js.. 
              // perhaps we need routes[LOAD_PLATFORM].test() and routes[LOAD_PLATFORM].params().nickname ?
              nickname: /platforms\/(.+)/.exec(actionPath)[1]
            }))
            break
        }
    }
  }
  return next(action)
}


export default LocationMiddleware