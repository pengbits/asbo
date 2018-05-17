import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import EpisodeGrid from './EpisodeGrid'

class EpisodeList extends Component {
  render() {
    return (<div>
      {this.renderBody()}
    </div>)
  }
  
  renderBody(){
    const {episodes,loading,onSetFilter} = this.props
    return (<div className={`episode-list ${loading ? 'episode-list--loading':''}`}>
      <h2 className='h2'>Episodes</h2>
      <EpisodeGrid episodes={episodes} onSetFilter={onSetFilter} />
    </div>)
  }
}

export default EpisodeList
