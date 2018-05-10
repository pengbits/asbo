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
    return (<div className={`platform-list ${loading ? 'platform-list--loading' : ''}`}>
      <h2 className='h2'>Platforms</h2>
      <ul className='menu'>
        {(platforms || []).map(p => <PlatformListItem 
          {...p} key={p.id}
        />)}
      </ul>
    </div>)
  }
  
  renderFooter(){
    return (<Link className='btn btn-primary' to='/platforms/new'>Add a Platform</Link>)
  }
}

export default PlatformList
