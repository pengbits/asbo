import { combineReducers } from 'redux'
import platforms from './platforms' 
import episodes from './episodes'
import filter from './filter'

const rootReducer = {
  platforms,
  filter,
  episodes
}

export default rootReducer