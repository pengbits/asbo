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
import routes from './routes'
import * as p from './redux/platforms'
import App from './components/app'

// import PlatformList from './containers/PlatformList'
// import PlatformDetails from './containers/PlatformDetails'
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
const renderComponent = (action) => {
  const Component = routes.component(action)
  console.log(Component)
  return (<App>
    <Component />
  </App>)
}

// render the app
render(
  <Provider store={store}>
    <ConnectedRouter history={history}>
      <Switch>
        <Route exact path="/platforms"           children={renderComponent(p.LOAD_PLATFORMS)} />
        <Route exact path="/platforms/:nickname" children={renderComponent(p.LOAD_PLATFORM)} />
      </Switch>
    </ConnectedRouter>
  </Provider>,
  document.getElementById('root')
)

