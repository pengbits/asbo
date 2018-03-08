// actions
import platform_data from './platforms-data'
import {createAction,createActions} from 'redux-actions'

// constants
export const LOAD_PLATFORMS   = 'LOAD_PLATFORMS'
export const SELECT_PLATFORM  = 'SELECT_PLATFORM'

// actions
export const loadPlatforms  = function(){
  // return function(dispatch){
  //   // setTimeout(function(platform_data){
  //   dispatch({
  //     type: 'LOAD_PLATFORMS_PENDING'
  //   })
  //   setTimeout(dispatch, 125, {
  //     type: 'LOAD_PLATFORMS_FULFILLED',
  //     payload: {
  //       platform_data
  //     }
  //   })
  // }
  return {
    type: LOAD_PLATFORMS,
    payload: new Promise((resolve,reject) => {
      setTimeout(resolve, 125)
    })
      .then(function() {
        return {
          platforms: platform_data.slice(0)
        }
      })
  }
}

// export const loadPlatforms  = createAction(LOAD_PLATFORMS);
export const selectPlatform = createAction(SELECT_PLATFORM)


const loadedState = {
  platforms : platform_data.slice(0)
}

// reducer
export default function reducer(state={platforms:[]}, action={}){
  switch(action.type){
    case 'LOAD_PLATFORMS_FULFILLED':
      const {platforms} = action.payload
      return {
        ...state,
        platforms
      }
    
    case SELECT_PLATFORM:
      const {nickname} = action.payload
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