import React, {Component} from 'react'
import EpisodeGridItem from './EpisodeGridItem'
import Filter from '../containers/EpisodeFilter'

class EpisodeGrid extends Component {
  
  render(){
    const {
      episodes,
      currentPage,
      onSetFilter
    } = this.props

    // console.log(`EpisodeGrid currentPage:${currentPage}`)
    return (<div className='episode-grid'>
      <Filter key='filter' onSetFilter={onSetFilter} />
      <div className='grid'>
        {(episodes || []).map(e => <EpisodeGridItem 
          {...e} key={e.id}
        />)}
      </div>
    </div>)
  }
  
}

export default EpisodeGrid
