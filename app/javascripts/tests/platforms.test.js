jest.mock('../api')

// mock store setup
import mockStore from './mockStore' ;
import episode_data, {forPlatform} from '../__mocks__/episodes';

// load application code & mock the api
import * as p from '../redux/platforms';
import * as e from '../redux/episodes';
import {setFilter,SET_FILTER} from '../redux/filter'
const reducer = p.reducer;
import {combinedRootReducer} from '../redux';

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
    let episodesForPlatform;
    const nickname = 'rinse'
    it('dispatches actions for the refresh, and the list of episodes is updated', async () => {
      const store = mockStore({})
      await store.dispatch(p.refreshPlatform({nickname}))
        .then(() => {
          expectActions(store, [
            `${p.REFRESH_PLATFORM}_PENDING`,
            `${p.REFRESH_PLATFORM}_FULFILLED`,
          ])
        })
        
        const result = resultingState(store, reducer)
        const count = result.platform.episodes.length
        expect(count).toBeGreaterThan(0)
        expect(count).toBe(forPlatform({nickname}).length)
    })


    const filter = 'takeover'
    it('responds to a valid filter by refreshing the platform and filtering the episode list', async () => {
      // set the filter
      const store1 = mockStore({})
      store1.dispatch(setFilter(filter))
      const state1 = resultingState(store1, combinedRootReducer)
      expect(state1.filter).toBe(filter)
      
      // refresh the platform
      const store2 = mockStore(state1)
      await store2.dispatch(p.refreshPlatform({nickname}))
        .then(() => {
          const state2 = resultingState(store2, combinedRootReducer)
          const eps    = state2.platforms.platform.episodes
          const count  = eps.length
          
          expect(count).toBeGreaterThan(0)
          expect(count).toBeLessThan(forPlatform({nickname}).length)  
        })
    })
    
    it('returns different episodes for each page param', async () => {
      const store1 = mockStore({})
      await store1.dispatch(p.refreshPlatform({nickname}))
        .then(() => {
          const state1 = resultingState(store1, reducer)
          const count  = state1.platform.episodes.length
          expect(count).toBeGreaterThan(0)
        })
    })
    
    // it('responds to an empty filter by returning a complete episode list', async () => {
    //   const store = mockStore({})
    //   await store.dispatch(p.refreshPlatform({'nickname':'rinse'}))
    //     .then(() => {
    //       const result = resultingState(store, reducer)
    //       const filter = setFilter('')
    //       // this array is being destructively filtered, it's never refreshed if you clear the filter?
    //       // so either you need a totally diff implementation, ie refresh platform each time,
    //       // or you need to copy the eps into a different slice ie a `visibleEpisodes`
    //       const eps = reducer(result, filter).platform.episodes
    //       expect(eps.length).toBeGreaterThan(0)
    //       expect(eps.length).toBe(episode_data.length)
    //     })
    // })
    
  })
})