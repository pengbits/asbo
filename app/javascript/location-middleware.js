import {push} from 'react-router-redux'
import {
  LOAD_PLATFORMS,
  SELECT_PLATFORM
} from './redux/platforms'

const LocationMiddleware = store => next => action => {
  // dispatch the action after a tiny delay, ie on next render
  // const deferredDispatch = (action, delay=0) => {
  //   return setTimeout(() => store.dispatch(action), delay)
  // }
  if(typeof action =='object'){ // not true of thunks, they'll be functions
    if(action.type == '@@router/LOCATION_CHANGE'){
      const actionPath  = (action.payload || {}).pathname.replace(/\/$/,'')
        switch(true) {
        case /platforms$/.test(actionPath):
          store.dispatch({
            type:LOAD_PLATFORMS
          })
          break
          
        case /platforms\/(.+)/.test(actionPath):

          store.dispatch({
            type:SELECT_PLATFORM, 
            payload: {
              nickname: actionPath.split('/')[1]
            }
          })
          break
      }
    }
  }
  return next(action)
}


export default LocationMiddleware