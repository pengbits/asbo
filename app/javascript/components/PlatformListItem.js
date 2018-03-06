import React, {Component} from 'react'

const PlatformListItem = ({name,id}) => {
  return (<li id={id}>
    <a href="#">{name}</a>
  </li>)
}

export default PlatformListItem