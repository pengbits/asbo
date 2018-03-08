// actions
import platform_data from './platforms-data'
import {createAction,createActions,handleActions} from 'redux-actions'

// constants
export const LOAD_PLATFORMS   = 'LOAD_PLATFORMS'
export const LOAD_PLATFORM    = 'LOAD_PLATFORM'

// actions
export const loadPlatform  = function(opts){
  return {
    type: LOAD_PLATFORM,
    payload: fetch(`/api/platforms/${opts.nickname}`)
      .then(response => {
        if(response.ok){
          return response.json()
        } else {
          throw new Error(response.statusText)
        }
      }).then(p => {
        return {
          // key is a reserved word in react-land, map it accordingly
          platform: {...p, nickname: p.key}
        }
      })
  }
}
export const loadPlatforms  = function(){
  return {
    type: LOAD_PLATFORMS,
    payload: fetch(`/api/platforms`)
      .then(response => {
        if(response.ok){
          return response.json()
        } else {
          throw new Error(response.statusText)
        }
      }).then(json => {
        return {
          // key is a reserved word in react-land, map it accordingly
          platforms: json.map(p => {
            return {...p, nickname: p.key}
          })
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
// might want to look into somethinbg like type-to-reducer
// https://github.com/tomatau/type-to-reducer
// or just handleActions from redux-actions
// https://redux-actions.js.org/docs/api/handleAction.html
export default function reducer(state={platforms:[]}, action={}){
  switch(action.type){
    case `${LOAD_PLATFORM}_PENDING`:
    case `${LOAD_PLATFORMS}_PENDING`:
      return state
      
    case `${LOAD_PLATFORM}_FULFILLED`:
      return {
        ...state,
        platform: action.payload.platform
      }
  
    case `${LOAD_PLATFORMS}_FULFILLED`:
      return {
        ...state,
        platforms: action.payload.platforms
      }
      
    default: 
      return state
    break
  }
}