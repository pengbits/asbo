jest.mock('../api')
import mockStore from './mockStore' ;

import {
  pagination,
  requestPage, REQUEST_PAGE,
  reducer
} from '../redux/pagination'

describe('Pagination', () => {
  
  describe('currentPage', () => {
    it('is set to 1 at init', () => {
      expect(reducer().currentPage).toBe(1)
    })
  })
  
  describe('pages', () => {
    it('can responds to requestPage action', async () => {
      const store = mockStore()
      await store.dispatch(requestPage({
        page: 2,
        resource: 'platform',
        nickname: 'rinse'
      }))
        .then(() => {
          console.log('page back')
        })
    })
  })
})