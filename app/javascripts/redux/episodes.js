import {createAction,createActions,handleActions} from 'redux-actions'
import API  from '../api'
import {setFilter} from './filter'
import {LOAD_PLATFORM, REFRESH_PLATFORM} from './platforms'
// constants
export const LOAD_EPISODES = 'LOAD_EPISODES'
export const LOAD_EPISODE  = 'LOAD_EPISODE'

// actions
export const loadEpisodes = function(opts={}){
  return {
    type: LOAD_EPISODES,
    payload: API.getEpisodes(opts).then(json => {
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

export const setFilterAndFetch = function(filter){
  return (dispatch, getState) => {
    // set the filter on its own slice so it's saved in state
    dispatch(setFilter(filter));
    // pass the filter to the api call so we can get filtered eps back
    return dispatch(loadEpisodes({filter}))
  }
}


export const initialState = {
  episodes : [],
  episode  : null,
  loading  : false
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
      
    case `${LOAD_PLATFORM}_FULFILLED`:
    case `${REFRESH_PLATFORM}_FULFILLED`:
      return {
        ...state,
        loading: false,
        episodes: action.payload.platform.episodes
      }
      
    default: 
      return state
    break
  }
}

export default reducer