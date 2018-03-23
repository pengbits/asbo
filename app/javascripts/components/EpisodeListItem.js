import React, {Component} from 'react'
import {Link} from 'react-router-dom'

const EpisodeListItem = ({id,name}) => (<li className='menu__item'>
  <span className='episode-snap'>
    <Link className='episode-snap__title' to={`/episodes/${id}`}>{name}</Link>
  </span>
</li>)

export default EpisodeListItem