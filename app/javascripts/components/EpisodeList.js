import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import EpisodeListItem from './EpisodeListItem'

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
      <ul className='menu'>
        {(episodes || []).map(e => <EpisodeListItem 
          {...e} platform={e.platform.nickname} key={e.id}
        />)}
      </ul>
    </div>)
  }
}

export default EpisodeList
