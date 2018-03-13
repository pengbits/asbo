import React, {Component} from 'react'
import {Link} from 'react-router-dom'

class PlatformDetails extends Component {
  render() {
    const {name,id,url,nickname,loading,error} = this.props
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
      <span className="platform-details__options">
        <Link to={`/platforms/${nickname}/edit`}>Edit</Link>{' '}|{' '}
        <span onClick={this.destroy.bind(this)}>Delete</span>
      </span>
      
    </div>
    )
  }
  
  destroy(){
    const {destroyPlatform,nickname} = this.props;
    destroyPlatform({
      nickname
    })
  }
}

export default PlatformDetails
