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

// imports:app
import App from './components/App'
import PlatformList from './containers/PlatformList'
import PlatformDetails from './containers/PlatformDetails'
import LocationMiddleware from './location-middleware'
import rootReducer from './redux'

// init history
const history = createHistory()

// init dev tools & store
const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
const store = createStore(
  combineReducers({
    ...rootReducer, 
    router: routerReducer
  }),
  composeEnhancers(
    applyMiddleware(routerMiddleware(history),LocationMiddleware)
  )
)
// Now you can dispatch navigation actions from anywhere!
// store.dispatch(push('/foo'))



// render the app
render(
  <Provider store={store}>
    <ConnectedRouter history={history}>
      <Switch>
        <Route exact path="/platforms"  component={PlatformList}/>
        <Route exact path="/platforms/:nickname" component={PlatformDetails} />
      </Switch>
    </ConnectedRouter>
  </Provider>,
  document.getElementById('root')
)

