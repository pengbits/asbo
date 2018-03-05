// actions
const LOAD_PLATFORMS = 'LOAD_PLATFORMS'

const initialState = {
  platforms : [{
    id: 0,
    name: 'nts.live',
    key: 'nts'
  },{
    id: 1,
    name: 'rinse fm',
    key: 'rinse'
  }],
  platform  : null
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