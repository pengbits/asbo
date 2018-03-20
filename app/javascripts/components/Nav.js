import React from 'react'
import { Link } from 'react-router-dom'

const Nav = ({}) => {
  return (<nav>
    <Link to='/'>Home</Link>{' '}|{' '} 
    <Link to='/platforms'>Platforms</Link>{' '}|{' '} 
    <Link to='/episodes'>Episodes</Link>
  </nav>)
}

export default Nav