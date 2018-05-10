import { combinedRootReducer } from './redux' 
import { REFRESH_PLATFORM, REFRESH_PLATFORM_NO_NEW_EPISODES } from './redux/platforms'

const RefreshMiddleware = store => next => action => {
  if(typeof action =='object'){
    if(action.type == `${REFRESH_PLATFORM}_FULFILLED`){
      const lastCount  = store.getState().episodes.episodes.length
      console.log(`|refresh middleware| before update: ${lastCount}`)
      const nextAction = next(action)
      const nextState  = combinedRootReducer({}, nextAction)
      const nextCount  = nextState.episodes.episodes.length
      if(nextCount == lastCount) store.dispatch({type:REFRESH_PLATFORM_NO_NEW_EPISODES})
      console.log(`|refresh middleware| after update: ${nextCount}`)
      return nextAction
    } 
  }
  
  return next(action)
}

export default RefreshMiddleware