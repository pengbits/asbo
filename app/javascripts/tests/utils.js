// helpers
export const expectActions = (store, expected) => {
  const actions = store.getActions();
  expect(actions).toHaveLength(expected.length)
  expect(actions.map(a => a.type)).toEqual(expected);  
}

// return state by running actions through the reducer
export const resultingState = (store, reducer, state) => {
  return store.getActions().reduce((state, action) => {
   return reducer(state, action)
  }, {})
}
