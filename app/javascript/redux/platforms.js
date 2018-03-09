import {createAction,createActions,handleActions} from 'redux-actions'
import API  from '../api'

// constants
export const LOAD_PLATFORMS   = 'LOAD_PLATFORMS'
export const LOAD_PLATFORM    = 'LOAD_PLATFORM'
export const NEW_PLATFORM     = 'NEW_PLATFORM'
export const CREATE_PLATFORM  = 'CREATE_PLATFORM'

// actions
export const loadPlatform  = function({nickname}){
  return {
    type: LOAD_PLATFORM,
    payload: API.getPlatform({nickname}).then(json => {
      return {
        platform: attrsFromServer(json)
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
          return attrsFromServer(p)
        })
      }
    })
  }
}

export const newPlatform = createAction(NEW_PLATFORM)

export const createPlatform = function(attrs){
  return {
    type: CREATE_PLATFORM,
    payload: API.createPlatform(attrs)
    .then(json => {
      console.log(json)
      return {
        platform: json
      }
    })
  }
}
// utils
// key is a reserved word in react-land, map it accordingly
const attrsFromServer = (p) => {
  return {...p, nickname: p.key}
}
const attrsForServer = (p) => {
  return {...p, key: p.nickname}
}

// reducer
// might want to look into somethinbg like type-to-reducer
// https://github.com/tomatau/type-to-reducer
// or just handleActions from redux-actions
// https://redux-actions.js.org/docs/api/handleAction.html
export const initialState = {
  platforms : [],
  platform  : null,
  loading: false
}
export default function reducer(state=initialState, action={}){
  switch(action.type){
    case `${LOAD_PLATFORM}_PENDING`:
    case `${LOAD_PLATFORMS}_PENDING`:
    case `${CREATE_PLATFORM}_PENDING`:
      return {
        ...state,
        loading: true
      }
      
    case `${LOAD_PLATFORM}_FULFILLED`:
    case `${CREATE_PLATFORM}_FULFILLED`:
      return {
        ...state,
        loading: false,
        platform: action.payload.platform
      }
  
    case `${LOAD_PLATFORMS}_FULFILLED`:
      return {
        ...state,
        loading: false,
        platforms: action.payload.platforms
      }
      
    case NEW_PLATFORM:
      return {
        ...state,
        loading:false,
        platform: {}
      }
    
    default: 
      return state
    break
  }
}