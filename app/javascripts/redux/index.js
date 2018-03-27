import { combineReducers } from 'redux'
import platforms from './platforms' 
import episodes from './episodes'

const rootReducer = {
  platforms,
  episodes
}

export default rootReducer