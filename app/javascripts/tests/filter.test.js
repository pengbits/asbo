import {
  setFilter,
  SET_FILTER,
  reducer
} from '../redux/filter'

describe('Filter', () => {
  
  it('is null at startup', () => {
    expect(reducer()).toBe(null)
  })
  
  it('can be set to a phrase', () => {
    const phrase = 'cousin'
    const action = setFilter(phrase)
    const state = reducer({}, action)
    expect(state).toEqual(phrase)
  })
  
})