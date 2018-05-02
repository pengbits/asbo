import {createAction,createActions,handleActions} from 'redux-actions'


// constants
export const INIT_MEDIA = 'INIT_MEDIA'
export const FETCH_EMBED = 'FETCH_EMBED'
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

export const fetchEmbed = function(cfg){
  return {
    type: FETCH_EMBED,
    payload: new Promise((resolve,reject) => {
      // http://soundcloud.com/oembed?format=json&url=https://soundcloud.com/rinsefm/theheatwave020518&amp;color=%234274e3&amp;auto_play=false&amp;hide_related=true&amp;show_comments=false&amp;show_user=false&amp;show_reposts=false&amp;show_teaser=true&show_artwork%27);
      setTimeout(resolve, 250, {
          "version": 1,
          "type": "rich",
          "provider_name": "SoundCloud",
          "provider_url": "http://soundcloud.com",
          "height": 400,
          "width": "100%",
          "title": "The Heatwave w/ P Money - Wednesday 2nd May 2018 by Rinse FM",
          "description": "",
          "thumbnail_url": "http://i1.sndcdn.com/artworks-000343244331-d3615l-t500x500.jpg",
          "html": "<iframe width=\"100%\" height=\"400\" scrolling=\"no\" frameborder=\"no\" src=\"https://w.soundcloud.com/player/?visual=true&url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F438267681&show_artwork=true&amp=&color=%234274e3&auto_play=false&hide_related=true&show_comments=false&show_user=false&show_reposts=false&show_teaser=true&show_artwork%27%29=\"></iframe>",
          "author_name": "Rinse FM",
          "author_url": "http://soundcloud.com/rinsefm"
        })
      })
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
      
    case `${FETCH_EMBED}_FULFILLED`:
      const {html} = action.payload
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