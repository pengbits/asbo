// mock store setup
import promiseMiddleware from 'redux-promise-middleware'
import configureStore from 'redux-mock-store'
import LocationMiddleware from '../location-middleware'
import MediaMiddleware from'../media-middleware'
import RefreshMiddleware from '../refresh-middleware'

import thunk from 'redux-thunk'
const middlewares = [
  // routerMiddleware(history),
  LocationMiddleware,
  MediaMiddleware,
  RefreshMiddleware,
  promiseMiddleware(),
  thunk
] // add your middlewares like `redux-thunk`
const mockStore = configureStore(middlewares)

export default mockStore