import React from 'react'
import Nav from './Nav'
import '../../stylesheets/app.scss'

const App = ({children}) => {
  const multiRegion = children && 
                      children.length && 
                      children.length == 2 && 
                      !!children[1];
  const primary     = multiRegion ? children[0] : children
  const secondary   = multiRegion ? children[1] : null
  
  return (<div className="container">
    <div className={`content ${multiRegion ? 'content--with-secondary' : ''}`}>
      <div className="content__primary">
        <h1 className='h1'>Asbo</h1>
        <Nav />
        {primary}
      </div>
      {secondary && <div className="content__secondary">
        {secondary}
      </div>}
    </div>
  </div>)
}

export default App
