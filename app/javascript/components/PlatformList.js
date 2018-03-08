import React, {Component} from 'react'
import PlatformListItem from './PlatformListItem'

class PlatformList extends Component {
  render() {
    const {platforms,loading} = this.props
    return loading ? <p>...</p> : (<div>
      <h2>Platforms</h2>
      <ul>
        {(platforms || []).map(p => <PlatformListItem 
          {...p} key={p.id}
        />)}
      </ul>
    </div>)
  }
}

export default PlatformList
