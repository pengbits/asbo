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
        <iframe width="100%" height="166" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/438286137&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"></iframe>   
       </div>
    </div>
  </div>
)

export default App
