import * as p from './platforms';
import API from '../__mocks__/api'

const reducer = p.reducer;

describe('Platforms', () => {
  describe('platforms#index', () => {
    test('there are no platforms in list at startup', () => {
      expect(p.initialState.platforms).toHaveLength(0)
    })
    
    test('there are some platforms in list after fetch', async () => {
      const data = await API.getPlatforms()
      expect(data).toHaveLength(3)
      // const {platforms} = await
      // const action = await p.loadPlatforms();
      // const state  = reducer({}, action)
      
    })
  })
})