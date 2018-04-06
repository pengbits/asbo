jest.mock('../api')

// mock store setup
import mockStore from './mockStore' ;

// load application code & mock the api
import * as p from '../redux/platforms';
import * as e from '../redux/episodes';
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
    it('dispatches actions for the referesh, and the list off episodes is updated', async () => {
      const store = mockStore({})
      const opts = {'nickname':'rinse'}
      await store.dispatch(p.refreshPlatform(opts))
        .then(() => {
          expectActions(store, [
            `${p.REFRESH_PLATFORM}_PENDING`,
            `${p.REFRESH_PLATFORM}_FULFILLED`,
          ])
        })
        
        const result = resultingState(store, reducer)
        const initialCount = result.platform.episodes.length
        expect(initialCount).toBeGreaterThan(0)
  
        // now try filtering the episodes within the same platform
        const filter = e.setFilter('takeover')
        const filteredCount = reducer(result, filter).platform.episodes.length
        expect(filteredCount).toBeGreaterThan(0)
        expect(filteredCount).toBeLessThan(initialCount)
    })
  })
})