import {createAction,createActions,handleActions} from 'redux-actions'
import API  from '../api'
import SET_FILTER from './episodes'

// constants
export const LOAD_PLATFORMS   = 'LOAD_PLATFORMS'
export const LOAD_PLATFORM    = 'LOAD_PLATFORM'
export const NEW_PLATFORM     = 'NEW_PLATFORM'
export const CREATE_PLATFORM  = 'CREATE_PLATFORM'
export const EDIT_PLATFORM    = 'EDIT_PLATFORM'
export const UPDATE_PLATFORM  = 'UPDATE_PLATFORM'
export const DESTROY_PLATFORM = 'DESTROY_PLATFORM'
export const REFRESH_PLATFORM = 'REFRESH_PLATFORM' // get eps for platform
 
// actions
export const loadPlatform  = function({nickname}){
  return {
    type: LOAD_PLATFORM,
    payload: API.getPlatform({nickname}).then(json => {
      return {
        platform: json
      }
    })
  }
}

export const loadPlatforms  = function(){
  return {
    type: LOAD_PLATFORMS,
    payload: API.getPlatforms().then(json => {
      return {
        platforms: json.slice(0)
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
      return {
        platform: json
      }
    })
  }
}

export const editPlatform = function({nickname}){
  return {
    type: EDIT_PLATFORM,
    payload: API.getPlatform({nickname})
      .then(json => {
        return {
          platform: json
        }
      })
  }
}

export const updatePlatform = function(attrs) {
  return {
    type: UPDATE_PLATFORM,
    payload: API.updatePlatform(attrs)
      .then(json => {
        return {
          platform: json
        }
      })
  }
}

export const refreshPlatform = function({nickname}) {
  return {
    type: REFRESH_PLATFORM,
    payload: API.refreshPlatform({nickname})
      .then (json => {
        return {
          platform: json
        }
      })
  }
}

export const destroyPlatform = function({nickname}){
  return {
    type: DESTROY_PLATFORM,
    payload: API.destroyPlatform({nickname})
    .then(json => {
      return {
        platform: json
      }
    })
  }
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

export const reducer = function(state=initialState, action={}){
  switch(action.type){
    case `${LOAD_PLATFORM}_PENDING`:
    case `${LOAD_PLATFORMS}_PENDING`:
    case `${CREATE_PLATFORM}_PENDING`:
    case `${UPDATE_PLATFORM}_PENDING`:
      return {
        ...state,
        loading: true
      }
    case `${LOAD_PLATFORM}_REJECTED`:
    case `${UPDATE_PLATFORM}_REJECTED`:
      return {
        ...state,
        loading: false,
        error: true
      }
      
    case `${LOAD_PLATFORM}_FULFILLED`:
    case `${EDIT_PLATFORM}_FULFILLED`:
    case `${CREATE_PLATFORM}_FULFILLED`:
    case `${REFRESH_PLATFORM}_FULFILLED`:
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
export default reducer