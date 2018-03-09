import React from 'react'
import Nav from './Nav'

const App = ({children}) => (
  <div>
    <h1>Asbo</h1>
    <Nav />
    {children}
  </div>
)

export default App
