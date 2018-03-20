import React from 'react'
import Nav from './Nav'
import '../../stylesheets/app.scss'

const App = ({children}) => (
  <div className="container">
    <div className="content">
      <h1 className='h1'>Asbo</h1>
      <Nav />
      {children}
    </div>
  </div>
)

export default App
