import React, {Component} from 'react'
import {Link} from 'react-router-dom'

const EpisodeGridItem = ({id,name,date,platform}) => (
  <div className='grid__item'>
    <div className='episode-tile'>
      <Link className='episode-tile__title' to={`/episodes/${id}`}>{name}</Link>
      <span className='episode-tile__date'>{date}</span>
    </div>
  </div>
)

export default EpisodeGridItem
