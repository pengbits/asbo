jest.mock('../api')

// mock store setup
import mockStore from './mockStore' ;
import episode_data, {pagedEpisodesForPlatform, forPlatform} from '../__mocks__/episodes';

// load application code & mock the api
import * as p from '../redux/platforms';
import * as e from '../redux/episodes';
import {setFilter,SET_FILTER} from '../redux/filter'
import {setPage, SET_PAGE} from '../redux/pagination'
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
    
    const getPlatform = ({nickname}) => {
      const store = mockStore({})
      return store.dispatch(p.loadPlatform({nickname}))
      .then(() => {
        expectActions(store, [
          "LOAD_PLATFORM_PENDING",
          "LOAD_PLATFORM_FULFILLED"
        ]);
        return resultingState(store, reducer)
      })
    }
    
    it('dispatches an action to get the platform entry', async () => {
      const opts = {'nickname':'nts'}
      await getPlatform(opts).then((state) => {
        expect(state.platform).toBeTruthy()
        expect(state.platform.nickname).toEqual(opts.nickname)          
      })
    })
    
    it('populates the episodes reducer with the contents of the platform response', async() => {
      await getPlatform({'nickname':'rinse'}).then((state) => {
        expect(state.platforms.platform.episodes).toHaveLength(0)
        expect(state.episodes.episodes).toHaveLength(10)
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
        
        const result = resultingState(store, combinedRootReducer)
        const count = result.episodes.episodes.length
        // console.log(result.episodes.episodes.map(ep => ep.name))
        expect(count).toBeGreaterThan(0)
        expect(count).toBe(pagedEpisodesForPlatform({nickname}).length)
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
          const eps = state2.episodes.episodes
          const count  = eps.length

          // expect(count).toBeGreaterThan(0)
          // expect(count).toBeLessThan(forPlatform({nickname}).length)  
        })
    })
    
    
    it('passes the current page to the api when refreshing', async () => {
      // set the page
      const store1 = mockStore({})
      store1.dispatch(setPage({'page': 2}))
      const state1 = resultingState(store1, combinedRootReducer)
      const page = state1.pagination.currentPage
      expect(page).toBe(2)
      
      // refresh the platform
      const store2 = mockStore(state1)
      await store2.dispatch(p.refreshPlatform({nickname,page}))
        .then(() => {
          const state2 = resultingState(store2, combinedRootReducer)
          const eps = state2.episodes.episodes
          // const eps    = state2.episodes
          const count  = eps.length
          // 
          expect(count).toBeGreaterThan(0)
          const expected = pagedEpisodesForPlatform({nickname,page})
        })
    })
  })
})