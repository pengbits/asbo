import React, {Component} from 'react'
import {Link} from 'react-router-dom'

const EpisodeListItem = ({id,name}) => (<li className='menu__item'>
  {name}
</li>)

export default EpisodeListItem