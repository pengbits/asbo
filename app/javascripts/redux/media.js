import {createAction,createActions,handleActions} from 'redux-actions'


// constants
export const INIT_MEDIA = 'RENDER_MEDIA_EMBED'
export const PLAY_MEDIA = 'PLAY_MEDIA'
export const STOP_MEDIA = 'PLAY_MEDIA'

export const initialState = {
  url : null,
  isPlaying : false,
  type: null,
  embed: null
}

export const initMedia = createAction(INIT_MEDIA)
export const playMedia = createAction(PLAY_MEDIA)
export const stopMedia = createAction(STOP_MEDIA)


export const reducer = function(state=initialState, action={}){
  switch(action.type){
    case INIT_MEDIA:
      const {url,type} = action.payload
      return {
        url,
        type,
        ...state
      }
    case PLAY_MEDIA:
      return {
        isPlaying: true,
        ...state
      }
      
    case STOP_MEDIA:
      return {
        isPlaying: false,
        ...state
      }
      
    default: 
      return state
    break
  }
}
export default reducer