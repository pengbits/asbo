// imports:router
import createHistory from 'history/createBrowserHistory'
import { Route } from 'react-router'
import { ConnectedRouter, routerReducer, routerMiddleware, push } from 'react-router-redux'

// imports:react
import React from 'react'
import { render } from 'react-dom'

// imports:redux
import { Provider } from 'react-redux'
import { createStore, combineReducers, applyMiddleware, compose } from 'redux'

// imports:app
import App from './components/App'
import PlatformList from './containers/PlatformList'
import PlatformDetails from './components/PlatformDetails'
import rootReducer from './redux'

// init history
const history = createHistory()
const middleware = routerMiddleware(history)

// init dev tools & store
const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
const store = createStore(
  combineReducers({
    ...rootReducer, 
    router: routerReducer
  }),
  composeEnhancers(applyMiddleware(middleware))
)
// Now you can dispatch navigation actions from anywhere!
// store.dispatch(push('/foo'))

// render the app
render(
  <Provider store={store}>
    <ConnectedRouter history={history}>
      <div>
        <Route exact path="/" component={App}/>
        <Route path="/platforms"  component={PlatformList}/>
        <Route path="/platforms/:key" component={PlatformDetails}/>
      </div>
    </ConnectedRouter>
  </Provider>,
  document.getElementById('root')
)
