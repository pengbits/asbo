import * as p from './redux/platforms';
import reducer from './redux/platforms';

describe('Platforms', () => {
  describe('platforms#index', () => {
    
    test('there are no platforms in list at startup', () => {
      const initialState = reducer();
      expect(initialState.platforms).toHaveLength(0)
    })
    
    test('there are some platforms in list after fetch', () => {
      
    })
  })
})