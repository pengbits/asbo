import React, {Component} from 'react'
import {Link} from 'react-router-dom'

class EpisodeDetails extends Component {
  render() {
    const {
      name,
      id,
      platform_id,
      loading,
      error
    } = this.props
    
    if(loading){
      return <p>...</p> 
    }
    else if(error){
      return <p  className='error'>An Error has occurred</p>
    }
    
    return ( 
    <div className="episode-details">
      <h2 className='h2'>Episode</h2>
      <p>
        <b>name</b><br />
        {name}
      </p>
      <p>
        <b>platform</b><br />
        {platform_id}
      </p>
      <p>
        <Link to={`/episodes`}>Back</Link>
      </p>
    </div>
    )
  }
}

export default EpisodeDetails
