import {combineReducers} from 'redux'
import {createAction,createActions,handleActions} from 'redux-actions'

// constants
export const REQUEST_PAGE = 'REQUEST_PAGE'
export const RECEIVE_PAGE = 'RECEIVE_PAGE'

// actions
export const requestPage = createAction(REQUEST_PAGE)

// reducers
export const currentPage = (currentPage = 1, action = {}) => {
  return action.type == REQUEST_PAGE ? action.payload.page : currentPage
}

export const pages = (pages={}, action={}) => {
  switch(action.type){
    case REQUEST_PAGE:
      return {
        ...pages,
        [action.payload.page]:{
          ids: [],
          fetching: true
        }
      }
    case RECEIVE_PAGE:
      return {
        ...pages,
        [action.payload.page]:{
          ids: action.payload.episodes.map(ep => ep.id),
          fetching: false
        }
      }
    default:
      return pages
  }
}

export const reducer = combineReducers({
  pages,
  currentPage
})

export default reducer