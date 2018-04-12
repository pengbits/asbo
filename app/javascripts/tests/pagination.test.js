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
})