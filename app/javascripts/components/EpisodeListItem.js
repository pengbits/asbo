import React, {Component} from 'react'
import {Link} from 'react-router-dom'

const EpisodeListItem = ({id,name,platformName}) => (
  <li className='menu__item'>
    <Link to={`/episodes/${id}`}>{name}</Link>
    <span className='menu__item__meta'>
      <em className='flag'>rinse</em>
    </span>
  </li>
)

export default EpisodeListItem