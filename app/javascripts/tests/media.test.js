jest.mock('../api')
import mockStore from './mockStore' ;
import {expectActions, resultingState} from './utils';
import reducer  from '../redux/media';

import {
  initMedia,
  startMedia, 
  stopMedia,
  fetchEmbed,
  FETCH_EMBED
} from '../redux/media'

describe('Media', () => {
  
  describe('init', () => {
    it('src is null at init', () => {
      expect(reducer().url).toBe(null)
    })
    
    it('can handle media with valid a type', () => {
      const action = initMedia({
        type: 'soundcloud',
        url: 'https://soundcloud.com/rinsefm/theheatwave020518'
      })
      expect(reducer({}, action).type).toBe('soundcloud')
    })
  })
  
  describe('embed', () => {
    it('can fetch the embed code from the url', async () => {
      const store = mockStore()
      await store.dispatch(fetchEmbed({
        type: 'soundcloud',
        url: 'https://api.soundcloud.com/tracks/428105211'
      }))
      .then(() => {
        expectActions(store, [
          `${FETCH_EMBED}_PENDING`,
          `${FETCH_EMBED}_FULFILLED`
        ]);
        console.log(resultingState(store,reducer))
        // const {embed} = resultingState(store, reducer)
        // expect(embed).toBeTruthy()
        // console.log(embed)
      })
      
    })
  })
  
})
