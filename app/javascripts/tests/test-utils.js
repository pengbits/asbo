// helpers
export const expectActions = (store, expected) => {
  const actions = store.getActions();
  expect(actions).toHaveLength(expected.length)
  expect(actions.map(a => a.type)).toEqual(expected);  
}

// return state after running last action in list
export const resultingState = (store, reducer, state=null) => {
  const actions = store.getActions().slice(0)
  return reducer(state, actions.pop())  
}
