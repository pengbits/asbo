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
    it('is set to 1 at init', () => {
      expect(reducer().currentPage).toBe(1)
    })
  })
  
  describe('pages', () => {
    it('can responds to setPage action', () => {
      const store = mockStore()
      store.dispatch(setPage({
        page: 2
      }))
      const result = resultingState(store, reducer)
      expect(result.currentPage).toBe(2)
    })
  })
  
})