jest.mock('../api')

// mock store setup
import mockStore from './mockStore' ;
import mock_episodes from '../__mocks__/episodes';

// load application code & mock the api
import * as p from '../redux/platforms';
import * as e from '../redux/episodes';
import {setFilter} from '../redux/filter'
const reducer = p.reducer;

// utils
import {expectActions,resultingState} from './utils'

// begin tests
describe('Platforms', () => {
  describe('platforms#index', () => {
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
        expect(resultingState(store, reducer).platforms.length).toBeGreaterThan(0)
      })
    })
  })
  
  describe('platforms#show', () => {
    it('dispatches an action to get the platform entry', async () => {
      const store = mockStore({})
      const opts = {'nickname':'nts'}
      await store.dispatch(p.loadPlatform(opts))
      .then(() => {
        expectActions(store, [
          "LOAD_PLATFORM_PENDING",
          "LOAD_PLATFORM_FULFILLED"
        ]);
        
        const state = resultingState(store, reducer)
        expect(state.platform).toBeTruthy()
        expect(state.platform.nickname).toEqual(opts.nickname)
      })
    })
  })
  
  describe('platforms#refresh', () => {
    it('dispatches actions for the refresh, and the list of episodes is updated', async () => {
      const store = mockStore({})
      await store.dispatch(p.refreshPlatform({'nickname':'rinse'}))
        .then(() => {
          expectActions(store, [
            `${p.REFRESH_PLATFORM}_PENDING`,
            `${p.REFRESH_PLATFORM}_FULFILLED`,
          ])
        })
        
        const result = resultingState(store, reducer)
        const initialCount = result.platform.episodes.length
        expect(initialCount).toBeGreaterThan(0)
    })
    
    it('responds to a valid filter by filtering the episode list', async () => {
      const store = mockStore({})
      await store.dispatch(p.refreshPlatform({'nickname':'rinse'}))
        .then(() => {
          const result = resultingState(store, reducer)
          const filter = setFilter('takeover')
          const filteredEps = reducer(result, filter).platform.episodes
          expect(filteredEps.length).toBeGreaterThan(0)
          expect(filteredEps.length).toBeLessThan(mock_episodes.length)
          // confirm they are the right eps
          const isMatch = ((ep,filter) => ep.name.toLowerCase().indexOf(filter.payload) > -1)
          const verified = filteredEps.filter(ep => isMatch(ep, filter))
          expect(verified.length).toBe(filteredEps.length)
        })
    })
    
    it('responds to an empty filter by returning a complete episode list', async () => {
      const store = mockStore({})
      await store.dispatch(p.refreshPlatform({'nickname':'rinse'}))
        .then(() => {
          const result = resultingState(store, reducer)
          const filter = setFilter('')
          const filteredEps = reducer(result, filter).platform.episodes
          expect(filteredEps.length).toBeGreaterThan(0)
          expect(filteredEps.length).toBe(mock_episodes.length)
        })
    })
    
  })
})