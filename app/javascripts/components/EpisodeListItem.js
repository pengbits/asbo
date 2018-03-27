import React, {Component} from 'react'
import {Link} from 'react-router-dom'

const EpisodeListItem = ({id,name,platformName}) => (
  <li className='menu__item'>
    <Link to={`/episodes/${id}`}>{name}</Link>
    <em className='menu__item-meta'>
      rinse
    </em>
  </li>
)

export default EpisodeListItem