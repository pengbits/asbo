import { combineReducers } from 'redux'
import platforms from './platforms' 
import episodes from './episodes'
import filter from './filter'
import pagination from './pagination'
import media from './media'

export const rootReducer = {
  platforms,
  filter,
  episodes,
  pagination,
  media
}

// 2/2 gather sub-reducers up into a single reducer containing the individual state slices,
// but allow each reducer access to the entire state object, for cross-cutting concerns 
// export const rootReducer = (state, action) => {      
//   return Object.keys(reducers).reduce((root, key) => {
//     root[key] = reducers[key](state[key], action, state)
//     return root
//   },{})
// }

export const combinedRootReducer = combineReducers(rootReducer)
export default rootReducer