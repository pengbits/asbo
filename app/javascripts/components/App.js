import React from 'react'
import Nav from './Nav'
import '../../stylesheets/app.scss'

const App = ({children}) => (
  <div className="container">
    <div className="content">
      <div className="content__primary">
        <h1 className='h1'>Asbo</h1>
        <Nav />
        {children}
      </div>
      <div className="content__secondary">
        <p>!</p>
      </div>
    </div>
  </div>
)

export default App
