import {push} from 'react-router-redux'
import routes from './routes'

import episodesReducer, { LOAD_EPISODE  } from './redux/episodes'
import { LOAD_PLATFORM } from './redux/platforms'
import { fetchEmbed, FETCH_EMBED } from './redux/media'

const LocationMiddleware = store => next => action => {

  if(typeof action =='object'){
    if(action.type == `${LOAD_EPISODE}_FULFILLED`){
      // extract the episode state slice..
      // and pull out what we need 
      const state = episodesReducer(null, action)
      if(state.episode){
        const {media} = state.episode
        media && store.dispatch(fetchEmbed(media))
      }
    }
  }
  
  return next(action)
}

export default LocationMiddleware