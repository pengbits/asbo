import React, {Component} from 'react'
import EpisodeGridItem from './EpisodeGridItem'
import Filter from './EpisodeFilter'

const EpisodeGrid = ({episodes,setFilter}) => (
  <div className='episode-grid'>
    <Filter setFilter={setFilter} />
    <div className='grid'>
      {(episodes || []).map(e => <EpisodeGridItem 
        {...e} key={e.id}
      />)}
    </div>
  </div>
)

export default EpisodeGrid
