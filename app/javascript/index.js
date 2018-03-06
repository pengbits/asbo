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
import rootReducer from './redux'

// init history
const history = createHistory()
// Build the middleware for intercepting and dispatching navigation actions
const middleware = routerMiddleware(history)

const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
const store = createStore(
  combineReducers({
    ...rootReducer, 
    router: routerReducer
  }),
  composeEnhancers(applyMiddleware(middleware))
)

render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('root')
)
