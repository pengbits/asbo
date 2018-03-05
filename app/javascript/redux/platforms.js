// actions
import platform_data from './platforms-data'
const LOAD_PLATFORMS = 'LOAD_PLATFORMS'

const initialState = {
  platforms : platform_data.slice(0)
}

// reducer
export default function reducer(state=initialState, action={}){
  switch(action.type){
    
    case LOAD_PLATFORMS:
      return state
    
    default: 
      return state
    break
  }
}