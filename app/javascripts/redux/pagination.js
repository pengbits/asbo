import {combineReducers} from 'redux'
import {createAction,createActions,handleActions} from 'redux-actions'
import {refreshPlatform, LOAD_PLATFORM} from './platforms'
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
export const currentPage = (currentPage=0, action = {}) => {
  switch (action.type){
    
    case `${LOAD_PLATFORM}_FULFILLED`:
      const {platform} = action.payload
      const last_page  = platform.last_page
      return last_page !== undefined ? last_page : currentPage // sync counter with db
    
    case SET_PAGE:
      return action.payload.page
    
    default:
      return currentPage
  }
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