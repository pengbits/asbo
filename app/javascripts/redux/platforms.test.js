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
      const store = mockStore({})
      return store.dispatch(p.loadPlatforms())
      .then(() => {
        expectActions(store, [
          "LOAD_PLATFORMS_PENDING",
          "LOAD_PLATFORMS_FULFILLED"
        ]);
          
        const readyState = reducer({}, store.getActions()[1])
        const {length} = readyState.platforms;
        console.log(`found ${length} platforms`)
        expect(length).toBeGreaterThan(0)

      })
  })
  
  describe('platforms#show json', () => {
    it('dispatches an action to get the platform entry', () => {
      const store = mockStore({})
      return store.dispatch(p.loadPlatform({'nickname':'nts'}))
        .then(() => expectActions(store, [
          "LOAD_PLATFORM_PENDING",
          "LOAD_PLATFORM_FULFILLED"
        ]))
      })
    })
  })
})