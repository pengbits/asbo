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
    const {episodes,loading} = this.props
    return loading ? <p>...</p> : (<div>
      <h2 className='h2'>Episodes</h2>
      <EpisodeGrid episodes={episodes} />
    </div>)
  }
}

export default EpisodeList
