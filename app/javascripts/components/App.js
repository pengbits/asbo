import React from 'react'
import Nav from './Nav'
import '../../stylesheets/app.scss'; 

const App = ({children}) => (
  <div>
    <h1>Asbo</h1>
    <Nav />
    {children}
  </div>
)

export default App
