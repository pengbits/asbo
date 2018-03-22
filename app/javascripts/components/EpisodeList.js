import React, {Component} from 'react'
import {Link} from 'react-router-dom'

const EpisodeListItem = ({id,name}) => (<p>{name}</p>);
class EpisodeList extends Component {
  render() {
    return (<div>
      {this.renderBody()}
    </div>)
  }
  
  renderBody(){
    const {episodes,loading} = this.props
    return loading ? <p>...</p> : (<div>
      <h2 className='h2'>Platforms</h2>
      <ul className='menu'>
        {(episodes || []).map(e => <EpisodeListItem 
          {...e} key={e.id}
        />)}
      </ul>
    </div>)
  }
}

export default EpisodeList
