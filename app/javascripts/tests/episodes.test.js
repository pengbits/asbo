jest.mock('../api')
import mock_episodes from '../__mocks__/episodes';

// mock store setup
import mockStore from './mockStore' ;

// load application code & mock the api
import {rootReducerCombined} from '../redux'
import * as e from '../redux/episodes';
const reducer = e.reducer;
import {setFilter} from '../redux/filter';
// utils
import {expectActions,resultingState} from './utils'

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
        expect(resultingState(store, reducer).episodes.length).toBeGreaterThan(0)
      })
    })
    
    it('setting a filter', async () => {
      const filter = 'takeover'
      const state = rootReducerCombined({}, setFilter(filter))
      expect(state.filter).toBe(filter)
    
      const store = mockStore({})
      await store.dispatch(e.setFilterAndFetch(filter))
        .then(() => {
          console.log('ready')
          // const filteredState = resultingState(store, reducer)
          // console.log(filteredState)
          expectActions(store,[
            'SET_FILTER',
            'LOAD_EPISODES_PENDING',
            'LOAD_EPISODES_FULFILLED'
          ])
          const result = resultingState(store, reducer, state)
          console.log(result.episodes.map((ep) => ep.name))
          expect(result.episodes.length).toBeLessThan(mock_episodes.length)
          expect(result.episodes.length).toBeGreaterThan(0)
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
        
        const state = resultingState(store, reducer)
        expect(state.episode).toBeTruthy()
        // expect(state.episode.id).toEqual(opts.id)
      })
    })
  })
})