import React, {Component} from 'react'
import {Link} from 'react-router-dom'

const EpisodeListItem = ({id,name,platform}) => (
  <li className='menu__item'>
    <Link to={`/episodes/${id}`}>{name}</Link>
    {platform && 
      <span className='menu__item__meta'>
        <em className='flag'>{platform}</em>
      </span>}
  </li>
)

export default EpisodeListItem