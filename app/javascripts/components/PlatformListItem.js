import React, {Component} from 'react'
import { Link } from 'react-router-dom'

const PlatformListItem = ({name,nickname,id}) => {
  return (<li className='menu__item' id={id}>
    <Link to={`/platforms/${nickname}`}>{name}</Link>
  </li>)
}

export default PlatformListItem