import React, {Component} from 'react'
import EpisodeGridItem from './EpisodeGridItem'

const EpisodeGrid = ({episodes}) => (
  <div className='grid'>
    {(episodes || []).map(e => <EpisodeGridItem 
      {...e} key={e.id}
    />)}
  </div>
)

export default EpisodeGrid
