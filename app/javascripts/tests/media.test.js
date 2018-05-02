import mockStore from './mockStore' ;
import {resultingState} from './utils';
import reducer  from '../redux/media';

import {
  initMedia,
  INIT_MEDIA,
  startMedia, 
  START_MEDIA,
  stopMedia,
  STOP_MEDIA
} from '../redux/media'

describe('Media', () => {
  
  describe('init', () => {
    it('src is null at init', () => {
      expect(reducer().url).toBe(null)
    })
    
    it('can handle media with valid a type', () => {
      const action = initMedia({
        type: 'soundcloud',
        url: 'https://api.soundcloud.com/tracks/428105211'
      })
      expect(reducer({}, action).type).toBe('soundcloud')
    })
  })
  
  describe('embed', () => {
    it('can retrieve the embed code from the url', () => {
      const store = mockStore()
      store.dispatch(initMedia({
        type: 'soundcloud',
        url: 'https://api.soundcloud.com/tracks/428105211'
      }))
      const result = resultingState(store, reducer)
      expect(result.embed).toBeTruthy()
    })
  })
  
})
