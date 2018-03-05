// actions
const LOAD_PLATFORMS = 'LOAD_PLATFORMS'

const initialState = {
  list : [],
  detail : null
}

// reducer
export default function reducer(state=initialState, action={}){
  switch(action.type)
  {
    
    case LOAD_PLATFORMS:
    console.log('LOAD_PLATFORMS')
      return state
    
    default: return state
  }
}