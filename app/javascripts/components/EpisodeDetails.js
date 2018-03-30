import React, {Component} from 'react'
import {Link} from 'react-router-dom'

class EpisodeDetails extends Component {
  render() {
    const {
      name,
      id,
      date,
      image,
      platform_id,
      loading,
      error,
      media,
      details
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
      {image && (<p>
        <img className='episode-image' src={image} />
      </p>)}
      <p>
        <b>platform</b><br />
        {platform_id}
      </p>
      <p>
        <b>date</b><br />
        {date}
      </p>
  
      {media && (<p><b>media type</b><br />
        {media.type}
      </p>)}
  
      {media && (<p><b>media url</b><br />
        <a href={media.url}>{media.url}</a>
      </p>)}
      
      {details && (<p><b>details url</b><br />
        <a href={details}>{details}</a>
      </p>)}
  
      <p>
        <Link to={`/episodes`}>Back</Link>
      </p>
    </div>
    )
  }
}

export default EpisodeDetails
