import * as p from './platforms';
import API from '../api'
jest.mock('../api')

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
      // const action = p.loadPlatforms();
      // const state  = reducer({}, action)
      
    })
  })
  
  describe('platforms#show', () => {
    test('returns a valid platform', async () => {
      const data = await API.getPlatform({nickname:'nts'})
      expect(data).toBeTruthy()
    })
  })
})