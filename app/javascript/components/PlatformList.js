import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import PlatformListItem from './PlatformListItem'

class PlatformList extends Component {
  render() {
    return (<div>
      {this.renderBody()}
      {this.renderFooter()}
    </div>)
  }
  
  renderBody(){
    const {platforms,loading} = this.props
    return loading ? <p>...</p> : (<div>
      <h2>Platforms</h2>
      <ul>
        {(platforms || []).map(p => <PlatformListItem 
          {...p} nickname={p.id}
        />)}
      </ul>
    </div>)
  }
  
  renderFooter(){
    return (<Link to='/platforms/new'>Add a Platform</Link>)
  }
}

export default PlatformList
