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
      expect(p.initialState.platforms).toHaveLength(0)
    })
    
    it('contains some platforms in list after fetch', async () => {
      const store = mockStore({});
      return store.dispatch(p.loadPlatforms())
        .then(() => expectActions(store, [
          "LOAD_PLATFORMS_PENDING",
          "LOAD_PLATFORMS_FULFILLED"
        ]))
  })
  
  describe('platforms#show json', () => {
    it('contains a valid platform', () => {
      const store = mockStore({})
      const action = p.loadPlatform({'nickname':'nts'});
      return store.dispatch(action)
        .then(() => expectActions(store, [
          "LOAD_PLATFORM_PENDING",
          "LOAD_PLATFORM_FULFILLED"
        ]))
      })
    })
  })
})