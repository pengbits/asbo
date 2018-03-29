import React, {Component} from 'react'
import {Link} from 'react-router-dom'

const bg = ({image}) => {
  return {
    backgroundRepeat: 'no-repeat',
    backgroundSize: 'cover',
    backgroundPosition: 'center',
    backgroundImage:`url(${image})`
  }
}

const EpisodeGridItem = ({id,name,image,date,platform}) => (
  <div className='grid__item' style={bg({image})}>
    <span className='grid__mask'>
    </span>
    <div className='episode-tile'>
      <Link className='episode-tile__title' to={`/episodes/${id}`}>{name}</Link>
      <span className='episode-tile__date'>{date}</span>
    </div>
  </div>
)

export default EpisodeGridItem
