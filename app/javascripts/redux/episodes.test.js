// mock store setup
import promiseMiddleware from 'redux-promise-middleware'
import configureStore from 'redux-mock-store'
import thunk from 'redux-thunk'
const middlewares = [promiseMiddleware(),thunk] // add your middlewares like `redux-thunk`
const mockStore = configureStore(middlewares)

// load application code & mock the api
import * as e from './episodes';
const reducer = e.reducer;
import API from '../api'
jest.mock('../api')


// helpers
const expectActions = (store, expected) => {
  const actions = store.getActions();
  expect(actions).toHaveLength(expected.length)
  expect(actions.map(a => a.type)).toEqual(expected);  
}

// return state after running last action in list
const resultingState = (store, state=null) => {
  const actions = store.getActions().slice(0)
  return reducer(state, actions.pop())  
}

// begin tests
describe('Episodes', () => {
  describe('episodes#index', () => {
    it('is empty at startup', () => {
      expect(reducer().episodes).toHaveLength(0)
    })
    
    it('dispatches an action to fetch the list of episodes', async () => {
      const store = mockStore({});
      await store.dispatch(e.loadEpisodes())
      .then(() => {
        expectActions(store, [
          "LOAD_EPISODES_PENDING",
          "LOAD_EPISODES_FULFILLED"
        ]);
        
        // and now look at the store to inspect its state.
        expect(resultingState(store).episodes.length).toBeGreaterThan(0)
      })
    })
  })
  
  describe('episodes#show', () => {
    it('dispatches an action to get the episode entry', async () => {
      const store = mockStore({})
      const opts = {'id':'1960'}
      await store.dispatch(e.loadEpisode(opts))
      .then(() => {
        expectActions(store, [
          "LOAD_EPISODE_PENDING",
          "LOAD_EPISODE_FULFILLED"
        ]);
        
        const state = resultingState(store)
        expect(state.episode).toBeTruthy()
        // expect(state.episode.id).toEqual(opts.id)
      })
    })
  })
})