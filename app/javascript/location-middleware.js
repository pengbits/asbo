import {push} from 'react-router-redux'
import routes from './routes'
import {
  LOAD_PLATFORMS,
  loadPlatforms,
  LOAD_PLATFORM,
  loadPlatform,
  NEW_PLATFORM
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
          case routes.test(actionPath, LOAD_PLATFORMS):
            store.dispatch(loadPlatforms())
            break
          
          case routes.test(actionPath, LOAD_PLATFORM):
            const nickname = routes.params(actionPath, LOAD_PLATFORM, 'nickname')
            store.dispatch(loadPlatform({nickname}))
            break
            
          case routes.test(actionPath, NEW_PLATFORM):
            console.log('NEW_PLATFORM found in middleware')
            break
        }
    }
  }
  return next(action)
}


export default LocationMiddleware