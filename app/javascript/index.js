// imports:router
import createHistory from 'history/createBrowserHistory'
import { Route, Switch } from 'react-router'
import { ConnectedRouter, routerReducer, routerMiddleware, push } from 'react-router-redux'
import { Link } from 'react-router-dom'

// imports:react
import React from 'react'
import { render } from 'react-dom'

// imports:redux
import { connect, Provider } from 'react-redux'
import { createStore, combineReducers, applyMiddleware, compose } from 'redux'

// imports:redux-async
import thunk from 'redux-thunk';
import promiseMiddleware from 'redux-promise-middleware'
// import promiseMiddleware from 'redux-promise';

// imports:app
import App from './components/App'
import PlatformList from './containers/PlatformList'
import PlatformDetails from './containers/PlatformDetails'
import LocationMiddleware from './location-middleware'
import rootReducer from './redux'

// init history
const history = createHistory()

// init dev tools & store
const k = '__REDUX_DEVTOOLS_EXTENSION_COMPOSE__';
const opts = {'actionsBlacklist' : ['@@router/LOCATION_CHANGE']} // these get noisy
const composeEnhancers = window[k] ? window[k](opts) : compose;
const store = createStore(
  combineReducers({
    ...rootReducer, 
    router: routerReducer
  }),
  composeEnhancers(
    applyMiddleware(
      routerMiddleware(history),
      LocationMiddleware,
      promiseMiddleware(),
      thunk
    )
  )
)
// Now you can dispatch navigation actions from anywhere!
// store.dispatch(push('/foo'))
const renderChildren = ({match}) => {
  console.log(match)
  return (<div>
    <h2>Asbo</h2> 
  </div>)
}

// render the app
render(
  <Provider store={store}>
    <ConnectedRouter history={history}>
      <Switch>
        <Route exact path="/"                    children={renderChildren} />
        <Route exact path="/platforms"           children={renderChildren} />
        <Route exact path="/platforms/:nickname" children={renderChildren} />
      </Switch>
    </ConnectedRouter>
  </Provider>,
  document.getElementById('root')
)

