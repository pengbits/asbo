import {createAction,createActions,handleActions} from 'redux-actions'
import API  from '../api'

// constants
export const LOAD_PLATFORMS   = 'LOAD_PLATFORMS'
export const LOAD_PLATFORM    = 'LOAD_PLATFORM'

// actions
export const loadPlatform  = function({nickname}){
  return {
    type: LOAD_PLATFORM,
    payload: API.getPlatform({nickname}).then(json => {
      return {
        platform: platformAttributes(json)
      }
    })
  }
}

export const loadPlatforms  = function(){
  return {
    type: LOAD_PLATFORMS,
    payload: API.getPlatforms().then(json => {
      return {
        platforms: json.map(p => {
          return platformAttributes(p)
        })
      }
    })
  }
}


// utils
// key is a reserved word in react-land, map it accordingly
const platformAttributes = (p) => {
  return {...p, nickname: p.key}
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