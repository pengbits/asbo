import {push} from 'react-router-redux'
import routes from './routes'
import {
  LOAD_PLATFORMS, loadPlatforms,
  LOAD_PLATFORM,  loadPlatform,
  NEW_PLATFORM,   newPlatform,
  CREATE_PLATFORM,
  DESTROY_PLATFORM
} from './redux/platforms'

const LocationMiddleware = store => next => action => {

  if(typeof action =='object'){ // not true of thunks, they'll be functions
    // listen to all location change actions so we can have a single source of truth
    // for mapping the url to actions, with  support for deep-linking and browser reloads..
    // curiously this didn't seem to be doable with the <router/> configurationa alone.
  
    if(action.type == '@@router/LOCATION_CHANGE'){
      const actionPath  = (action.payload || {}).pathname.replace(/\/$/,'')
        switch(true) {
          case routes.test(actionPath, LOAD_PLATFORMS):
            store.dispatch(loadPlatforms())
            break
        
          case routes.test(actionPath, NEW_PLATFORM):
            store.dispatch(newPlatform())
            break
          
          case routes.test(actionPath, LOAD_PLATFORM):
            const nickname = routes.params(actionPath, LOAD_PLATFORM, 'nickname')
            store.dispatch(loadPlatform({nickname}))
            break
        }
    }
    // for the create/destroy, it's more convenient to simply redirect back to the index,
    // perhaps we could add a flash mesage of some sort?
    if(action.type == `${CREATE_PLATFORM}_FULFILLED`){
      store.dispatch(push('/platforms'))
    }
    if(action.type == `${DESTROY_PLATFORM}_FULFILLED`){
      store.dispatch(push('/platforms'))
    }
  }
  return next(action)
}


export default LocationMiddleware