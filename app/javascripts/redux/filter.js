import {createAction,createActions,handleActions} from 'redux-actions'

// constants
export const SET_FILTER    = 'SET_FILTER'
 
// actions
export const setFilter = createAction(SET_FILTER)

// reducer
export const reducer = (state=null, action={}) => {
  switch(action.type){
    case SET_FILTER:
      return action.payload
      
    default:
      return state
  }
}