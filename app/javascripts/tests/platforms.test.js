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
  
  const getPlatform = ({nickname}) => {
    const store = mockStore({})
    return store.dispatch(p.loadPlatform({nickname}))
    .then(() => {
      expectActions(store, [
        "LOAD_PLATFORM_PENDING",
        "LOAD_PLATFORM_FULFILLED"
      ]);
      return resultingState(store, combinedRootReducer)
    })
  }
  
  describe('platforms#show', () => {  
    it('dispatches an action to get the platform entry', async () => {
      const opts = {'nickname':'nts'}
      await getPlatform(opts).then((state) => {
        expect(state.platforms.platform).toBeTruthy()
        expect(state.platforms.platform.nickname).toEqual(opts.nickname)          
      })
    })
    
    it('populates the episodes reducer with the contents of the platform response', async() => {
      await getPlatform({'nickname':'rinse'}).then((state) => {
        expect(state.platforms.platform.episodes).toHaveLength(0)
        expect(state.episodes.episodes).toHaveLength(10)
      })
    })
  })
  
  const refreshPlatform = ({nickname}) => {
    const store = mockStore({})
    return store.dispatch(p.refreshPlatform({nickname}))
      .then(() => {
        expectActions(store, [
          `${p.REFRESH_PLATFORM}_PENDING`,
          `${p.REFRESH_PLATFORM}_FULFILLED`,
        ])
        const state = resultingState(store, combinedRootReducer)
        return {state, store: mockStore(state)}
      })
  }

  describe('platforms#refresh', () => {
    
    const nickname = 'rinse'
    const opts = {nickname}
    it('dispatches actions for the refresh, and the list of episodes is updated', async () => {
      await refreshPlatform(opts).then(({state}) => {
        const count = state.episodes.episodes.length
        expect(count).toBeGreaterThan(0)
        expect(count).toBe(pagedEpisodesForPlatform(opts).length)
      })
    })
    
    it('knows when the refresh did not yield any new episodes', async () => {
      let lastCount
      // get initial platform
      await getPlatform({'nickname':'rinse'}).then((state) => {
        lastCount = state.episodes.episodes.length
        expect(lastCount).toBeGreaterThan(0)
        return state
      // refresh the platform
      }).then((state) => {
        const store = mockStore(state)
        return store.dispatch(p.refreshPlatform({nickname}))
        .then(() => {
          const newCount = resultingState(store, combinedRootReducer).episodes.episodes.length
          let actions = [
            `${p.REFRESH_PLATFORM}_PENDING`,
            `${p.REFRESH_PLATFORM}_FULFILLED`
          ]
          if(newCount == lastCount) actions.push(`${p.REFRESH_PLATFORM_NO_NEW_EPISODES}`)
          expectActions(store, actions)
        })
      })
    })


    const filter = 'grime'
    it('responds to a valid filter by refreshing the platform and filtering the episode list', async () => {
      // set the filter
      const store1 = mockStore({})
      store1.dispatch(setFilter(filter))
      const state1 = resultingState(store1, combinedRootReducer)
      expect(state1.filter).toBe(filter)

      // refresh the platform
      const store2 = mockStore(state1)
      await store2.dispatch(p.refreshPlatform(opts))
        .then(() => {
          const state2 = resultingState(store2, combinedRootReducer)
          const eps = state2.episodes.episodes
          const count  = eps.length
          console.log(`found filtered eps ${eps.length}`)
          expect(count).toBeLessThan(forPlatform({nickname}).length)  
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
  
  
  describe('lastPage', () => {
    it('is incremented when after api returns a page of episodes', (done) => {
      const opts = {'nickname':'rinse'}
      
      let lastPageBefore,
      lastPageAfter,
      refreshedState
      
      // 1. get a platform
      getPlatform(opts).then((state1) => {
        lastPageBefore = state1.platforms.platform.last_page
      })
      .then(() => {
      // 2. get a page of episodes
        return refreshPlatform(opts).then((xhr) => {
          refreshedState = xhr.state
        })
      }).then(() => {
      // 3. compare last_page before and after
        lastPageAfter = refreshedState.platforms.platform.last_page
        expect(lastPageAfter).toBeGreaterThan(lastPageBefore)
        return done()
      })
    })
  })
  
  describe('platforms#delete_episodes', () => {
    // see episodes tests
  })
})