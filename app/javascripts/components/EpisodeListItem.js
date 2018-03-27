import React, {Component} from 'react'
import {Link} from 'react-router-dom'

const EpisodeListItem = ({id,name}) => (<li className='menu__item'>
  <Link to={`/episodes/${id}`}>{name}</Link>
</li>)

export default EpisodeListItem