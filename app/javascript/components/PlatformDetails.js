import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import AttributeMapReadOnly from './AttributeMapReadOnly'
import RemoveWithConfirmLink from './RemoveWithConfirmLink'

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
      <h2>Platform Details</h2>
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
      <AttributeMapReadOnly map={attr_map} />
      <p className="platform-details__options">
        <Link to='/platforms'>Back</Link>{' '}|{' '}
        <Link to={`/platforms/${nickname}/edit`}>Edit</Link>{' '}|{' '}
        <RemoveWithConfirmLink 
          dispatch={destroyPlatform} dispatchArgs={{nickname}}
        />
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
