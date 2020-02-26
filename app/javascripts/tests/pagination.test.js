jest.mock('../api')
import mockStore from './mockStore' ;
import {resultingState} from './utils';

import {
  pagination,
  setPage, SET_PAGE,
  reducer
} from '../redux/pagination'

describe('Pagination', () => {
  
  describe('currentPage', () => {
    it('is set to 0 at init', () => {
      expect(reducer().currentPage).toBe(0)
    })
    it('can be changed by setPage action', () => {
      const store = mockStore()
      store.dispatch(setPage({
        page: 2
      }))
      const result = resultingState(store, reducer)
      expect(result.currentPage).toBe(2)
    })
  })
})