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
    <Link className='episode-tile' to={`/episodes/${id}`}>
      <span className='episode-tile__title'>{name}</span>
      <span className='episode-tile__date'>{date}</span>
    </Link>
  </div>
)

export default EpisodeGridItem
