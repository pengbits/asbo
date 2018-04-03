// mock store setup
import promiseMiddleware from 'redux-promise-middleware'
import configureStore from 'redux-mock-store'
import thunk from 'redux-thunk'
const middlewares = [promiseMiddleware(),thunk] // add your middlewares like `redux-thunk`
const mockStore = configureStore(middlewares)

// load application code & mock the api
import * as p from './platforms';
const reducer = p.reducer;
const {initialState} = p.reducer;
import API from '../api'
jest.mock('../api')


// helpers
const expectActions = (store, expected) => {
  const actions = store.getActions();
  expect(actions).toHaveLength(expected.length)
  expect(actions.map(a => a.type)).toEqual(expected);  
}


// begin tests
describe('Platforms', () => {
  describe('platforms#index json', () => {
    it('is empty at startup', () => {
      expect(reducer().platforms).toHaveLength(0)
    })
    
    it('dispatches an action to fetch the list of platforms', async () => {
      const store = mockStore({});
      await store.dispatch(p.loadPlatforms())
      .then(() => {
        // we expect to see the _PENDING and the _FULFILLED form 
        // of any async action that's fired succesfully
        expectActions(store, [
          "LOAD_PLATFORMS_PENDING",
          "LOAD_PLATFORMS_FULFILLED"
        ]);
        
        // and now look at the store to inspect its state.
        const readyState = reducer(null, store.getActions()[1])
        expect( readyState.platforms.length).toBeGreaterThan(0)
      })
    })
  })
  
  describe('platforms#show json', () => {
    it('dispatches an action to get the platform entry', async () => {
      const store = mockStore({})
      const opts = {'nickname':'nts'}
      await store.dispatch(p.loadPlatform(opts))
      .then(() => {
        expectActions(store, [
          "LOAD_PLATFORM_PENDING",
          "LOAD_PLATFORM_FULFILLED"
        ]);
        
        const readyState = reducer(null, store.getActions()[1])
        expect( readyState.platform).toBeTruthy()
        expect( readyState.platform.nickname).toEqual(opts.nickname)
      })
    })
  })
})