// mock store setup
import promiseMiddleware from 'redux-promise-middleware'
import configureStore from 'redux-mock-store'
import thunk from 'redux-thunk'
const middlewares = [promiseMiddleware(),thunk] // add your middlewares like `redux-thunk`
const mockStore = configureStore(middlewares)

// load application code & mock the api
import * as p from './platforms';
const reducer = p.reducer;
import API from '../api'
jest.mock('../api')

// begin tests
describe('Platforms', () => {
  describe('platforms#index json', () => {
    it('is empty at startup', () => {
      expect(p.initialState.platforms).toHaveLength(0)
    })
    
    it('contains some platforms in list after fetch', async () => {
      const data = await API.getPlatforms()
      expect(data).toHaveLength(3)
      // const {platforms} = await
      // const action = p.loadPlatforms();
      // const state  = reducer({}, action)
      
    })
  })
  
  describe('platforms#show js', () => {
    it('contains a valid platform', async () => {
      const store = mockStore({})
      const action = p.loadPlatform({'nickname':'nts'});
      return store.dispatch(action)
        .then(() => {
            const actions = store.getActions()
            expect(actions).toHaveLength(2)
            expect(actions.map(a => a.type)).toEqual([
              "LOAD_PLATFORM_PENDING",
              "LOAD_PLATFORM_FULFILLED"
            ])
        })
    })
  })
})