import {createAction,createActions,handleActions} from 'redux-actions'
import API  from '../api'

// constants
export const LOAD_EPISODES   = 'LOAD_EPISODES'
export const LOAD_EPISODE    = 'LOAD_EPISODE'

// actions
export const loadEpisodes = function(){
  return {
    type: LOAD_EPISODES,
    payload: API.getEpisodes().then(json => {
      return {
        episodes: json.slice(0)
      }
    })
  }
}
export const loadEpisode = function({id}){
  return {
    type: LOAD_EPISODE,
    payload: API.getEpisode({id}).then(json => {
      return {
        episode: json
      }
    })
  }
}


export const initialState = {
  episodes : [],
  episode  : null,
  loading: false
}

export const reducer = (state=initialState, action={}) => {
  switch(action.type){
    case `${LOAD_EPISODES}_PENDING`:
    case `${LOAD_EPISODE}_PENDING`:
      return {
        ...state,
        loading: true
      }
    case `${LOAD_EPISODES}_REJECTED`:
    case `${LOAD_EPISODE}_REJECTED`:
      return {
        ...state,
        loading: false,
        error: true
      }
      
    case `${LOAD_EPISODES}_FULFILLED`:
      return {
        ...state,
        loading: false,
        episodes: action.payload.episodes
      }
      
    case `${LOAD_EPISODE}_FULFILLED`:  
      return {
        ...state,
        loading: false,
        episode: action.payload.episode
      }

    default: 
      return state
    break
  }
}

export default reducer