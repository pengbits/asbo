import React, {Component} from 'react'
import { Link } from 'react-router-dom'

const PlatformListItem = ({name,nickname,id}) => {
  return (<li id={id}>
    <Link to={`/platforms/${nickname}`}>{name}</Link>
  </li>)
}

export default PlatformListItem