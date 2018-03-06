// actions
import {createAction,createActions} from 'redux-actions'

import platform_data from './platforms-data'
// constants
export const LOAD_PLATFORMS   = 'LOAD_PLATFORMS'
export const SELECT_PLATFORM  = 'SELECT_PLATFORM'
// actions
export const loadPlatforms = createAction(LOAD_PLATFORMS)
export const selectPlatform = createAction(SELECT_PLATFORM)


const loadedState = {
  platforms : platform_data.slice(0)
}

// reducer
export default function reducer(state={platforms:[]}, action={}){
  switch(action.type){
    case LOAD_PLATFORMS:
      return {...loadedState}
    
    case SELECT_PLATFORM:
      const {nickname} = action.payload
      console.log(action)
      return {
        ...state, 
        platform : nickname ? 
          state.platforms.find(p => p.nickname == nickname) : null
      } 
      
    default: 
      return state
    break
  }
}