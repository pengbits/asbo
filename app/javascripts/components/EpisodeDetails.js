import React, {Component} from 'react'
import {Link} from 'react-router-dom'

class EpisodeDetails extends Component {
  render() {
    const {
      name,
      id,
      date,
      image,
      platform,
      loading,
      error,
      media,
      details_absolute
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
        <img className='episode-details__image' src={image} />
      </p>)}
      <p>
        <b>platform</b><br />
      {platform && 
        <Link to={`/platforms/${platform.nickname}`}>
          {platform.nickname}
        </Link>}
      </p>
      <p>
        <b>date</b><br />
        {date}
      </p>
  
      {media && (<p><b>media type</b><br />
        {media.type}
      </p>)}
  
      {media && (<p><b>media url</b><br />
        <a href={media.url} onClick={this.fetchEmbed.bind(this)}>{media.url}</a>
      </p>)}
      
      {details_absolute && (<p><b>details url</b><br />
        <a href={details_absolute}>{details_absolute}</a>
      </p>)}
  
      <p>
        <Link to={`/episodes`}>Back</Link>
      </p>
    </div>
    )
  }
  
  fetchEmbed(e){
    const {media, fetchEmbed} = this.props;
    const {url,type} = media;

    e.preventDefault()
    fetchEmbed({url,type})
  }
}

export default EpisodeDetails
