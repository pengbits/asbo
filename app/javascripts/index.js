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
import { reducer as formReducer } from 'redux-form'

// imports:redux-async
import thunk from 'redux-thunk';
import promiseMiddleware from 'redux-promise-middleware'
// import promiseMiddleware from 'redux-promise';

// imports:app
import routes from './routes'
import * as p from './redux/platforms'
import * as e from './redux/episodes'
import App from './components/app'

// import PlatformList from './containers/PlatformList'
// import PlatformDetails from './containers/PlatformDetails'
import LocationMiddleware from './location-middleware'
import rootReducer from './redux'

// init history
const history = createHistory()

// TODO prolly need to extract store setup and move elsewhere,
// perhaps alongside similar setup for a mockstore?
// init dev tools & store
const k = '__REDUX_DEVTOOLS_EXTENSION_COMPOSE__';
const opts = {'actionsBlacklist' : ['@@router/LOCATION_CHANGE','@@redux-form']} // these get noisy
const composeEnhancers = window[k] ? window[k](opts) : compose;
const store = createStore(
  combineReducers({
    ...rootReducer, 
    form: formReducer,
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
  if(action){
    const PrimaryComponent    = routes.component(action)
    const SecondaryComponent  = routes.component(action, {secondary:true})

    return (<App>
      <PrimaryComponent />{!!SecondaryComponent && 
        <SecondaryComponent />
      }
    </App>)
  } else {
    return (<App />)
  }
}

const bindComponent = action => () => renderComponent(action)

// render the app
render(
  <Provider store={store}>
    <ConnectedRouter history={history}>
      <Switch>
        <Route exact path="/"                         render={bindComponent()}                  />
        <Route exact path="/platforms"                render={bindComponent(p.LOAD_PLATFORMS)}  />
        <Route exact path="/platforms/new"            render={bindComponent(p.NEW_PLATFORM)}    />
        <Route exact path="/platforms/:nickname"      render={bindComponent(p.LOAD_PLATFORM)}   />
        <Route exact path="/platforms/:nickname/edit" render={bindComponent(p.EDIT_PLATFORM)}   />
        <Route exact path="/episodes"                 render={bindComponent(e.LOAD_EPISODES)}   />
        <Route exact path="/episodes/:id"             render={bindComponent(e.LOAD_EPISODE)}    />
      </Switch>
    </ConnectedRouter>
  </Provider>,
  document.getElementById('root')
)

