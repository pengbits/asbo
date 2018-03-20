import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import PropertyMapReadOnly from './PropertyMapReadOnly'
import Hint from './Hints.js'

class PlatformDetails extends Component {
  render() {
    const {
      name,
      id,
      url,
      nickname,
      loading,
      error,
      has_details,
      attr_map,
      pagination,
      destroyPlatform
    } = this.props
    
    if(loading){
      return <p>...</p> 
    }
    else if(error){
      return <p  className='error'>An Error has occurred</p>
    }
    
    return ( 
    <div className="platform-details">
      <h2>Platform</h2>
      <p>
        <b>name</b><br />
        {name}
      </p>
      <p>
        <b>nickname</b><br />
        {nickname}
      </p>
      <p>
        <b>url</b><br />
        <a href={url}>{url}</a>
      </p>
      <p>
        <b>has details</b><br />
        {has_details ? 'yes' : 'no' }
      </p>
      <p>
        <b>attribute map</b><br />
      </p>
      {attr_map && 
        <PropertyMapReadOnly map={attr_map} />
      }
      <p>
        <b>pagination</b><br />
      </p>
      {pagination && 
        <PropertyMapReadOnly map={pagination} />
      }
      <p className="platform-details__options">
        <Link to={`/platforms/${nickname}/edit`}>Edit Platform</Link><br />
        <Link to={`/platforms`}>Back</Link>
      </p>
    </div>
    )
  }
  
  destroy(){
    const {destroyPlatform,nickname} = this.props;
    confirm('Permanently delete this platform?') && destroyPlatform({nickname})
  }
}

export default PlatformDetails
