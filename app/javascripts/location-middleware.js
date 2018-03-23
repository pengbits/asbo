import {push} from 'react-router-redux'
import routes from './routes'
import {
  LOAD_PLATFORMS, loadPlatforms,
  LOAD_PLATFORM,  loadPlatform,
  NEW_PLATFORM,   newPlatform,
  CREATE_PLATFORM, 
  EDIT_PLATFORM,  editPlatform,
  UPDATE_PLATFORM,
  DESTROY_PLATFORM
} from './redux/platforms'

import {
  LOAD_EPISODES, loadEpisodes
} from './redux/episodes'

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
  
          case routes.test(actionPath, EDIT_PLATFORM):
            store.dispatch(
              editPlatform({
                'nickname' : routes.params(actionPath, EDIT_PLATFORM, 'nickname')
              })
            )
            break
          
          case routes.test(actionPath, LOAD_PLATFORM):
            store.dispatch(
              loadPlatform({
                'nickname' : routes.params(actionPath, LOAD_PLATFORM, 'nickname')
              })
            )
            break
            
          case routes.test(actionPath, LOAD_EPISODES):
            store.dispatch(loadEpisodes())
            break
        }
    }
    // for the create/destroy, it's more convenient to simply redirect back to the index,
    // perhaps we could add a flash mesage of some sort?
    if(action.type == `${UPDATE_PLATFORM}_FULFILLED`){
      const {platform} = action.payload;
      if(platform && platform.nickname){
        store.dispatch(push(`/platforms/${platform.nickname}`))
      } else {
        throw new Error('update failed')
      }
    }
    if(action.type == `${CREATE_PLATFORM}_FULFILLED` || 
       action.type == `${DESTROY_PLATFORM}_FULFILLED`)
    {
      store.dispatch(push('/platforms'))
    }
  }
  return next(action)
}


export default LocationMiddleware