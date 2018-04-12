import {combineReducers} from 'redux'
import {createAction,createActions,handleActions} from 'redux-actions'
import {refreshPlatform} from './platforms'
// constants
export const SET_PAGE = 'SET_PAGE';
// export const SET_PAGE_AND_REFRESH_PLATFORM = 'SET_PAGE_AND_REFRESH_PLATFORM'

// actions
export const setPage = createAction(SET_PAGE)
// export const setPageAndRefreshPlatform = function({page,nickname}) => {
//   return (dispatch, getState) => {
//     dispatch(setPage({page}))
//     return {
//       type: SET_PAGE_AND_REFRESH_PLATFORM,
//       payload: API.refreshPlatform(attrs)
//         .then(json => {
//           return {
//             platform: json
//           }
//         })
//     }
//   }
// }
// 


// reducers
export const currentPage = (currentPage = 1, action = {}) => {
  return action.type == SET_PAGE ? action.payload.page : currentPage
}

export const pages = (pages={}, action={}) => {
  switch(action.type){
    default:
      return pages
  }
}

export const reducer = combineReducers({
  pages,
  currentPage
})

export default reducer