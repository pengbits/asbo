import API from '../api'
import {createAction,createActions,handleActions} from 'redux-actions'


// constants
export const INIT_MEDIA = 'INIT_MEDIA'
export const FETCH_EMBED = 'FETCH_EMBED'
export const CLEAR_MEDIA = 'CLEAR_MEDIA'

export const initialState = {
  url : null,
  type: null,
  embed: null
}


export const initMedia = createAction(INIT_MEDIA)
export const clearMedia = createAction(CLEAR_MEDIA)

export const fetchEmbed = function({url,type}){
  return {
    type: FETCH_EMBED,
    payload: API.getMediaEmbed({url,type})
  }
}


export const reducer = function(state=initialState, action={}){
  switch(action.type){
    case INIT_MEDIA:
      const {url,type} = action.payload
      return {
        url,
        type,
        ...state
      }
    
    case CLEAR_MEDIA:
      return initialState
      
    case `${FETCH_EMBED}_FULFILLED`:
      let {html} = action.payload
      html = html.replace('height="400"','height="166"')
      return {
        ...state,
        embed: {
          html
        }
      }
    default: 
      return state
    break
  }
}
export default reducer