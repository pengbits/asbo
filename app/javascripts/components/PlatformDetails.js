import React, {Component} from 'react'
import {Link} from 'react-router-dom'
import PropertyMapReadOnly from './PropertyMapReadOnly'
import Hint from './Hints.js'
import EpisodeGrid from './EpisodeGrid'

class PlatformDetails extends Component {
  render() {
    const {
      name,
      id,
      url,
      default_image,
      nickname,
      loading,
      error,
      has_details,
      attr_map,
      pagination,
      refreshPlatform,
      episodes,
      currentPage
    } = this.props
    
    if(error){
      return <p  className='error'>An Error has occurred</p>
    }
    
    return ( 
    <div className={`platform-details ${loading ? 'platform-details--loading':''}`}>
      <h2 className='h2'>Platform</h2>
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
        <b>default_image</b><br />
        {default_image}
      </p>
      <p>
        <Link to={`/platforms/${nickname}/edit`}>Edit Platform</Link><br />
      </p>
      <p>
        <b>Episodes</b>{' '}{this.refreshButton()}
      </p>
      <p>
        {this.episodeGrid()}
      </p>
      <p>
        &nbsp;
      </p>
      <p>
        <Link to={`/platforms/${nickname}/edit`}>Edit Platform</Link><br />
        <Link to={`/platforms`}>Back</Link>
      </p>
    </div>
    )
  }
  
  refreshButton(){
    const {nextPage} = this.props;
    
    return (<button className='btn btn-s' onClick={this.refreshPlatform.bind(this)}>
      Refresh
    </button>)
  }
  
  episodeGrid(){
    const {episodes,currentPage} = this.props
    return <EpisodeGrid 
      episodes={episodes || []}
      currentPage={currentPage}
      onSetFilter={this.onSetFilter.bind(this)} 
    />
  }
  
  refreshPlatform(){
    const {nextPage,nickname} = this.props;
    this.props.setPageAndRefresh({nickname,page:nextPage})
  }
  
  onSetFilter({filter}){
    const {nickname} = this.props
    this.props.setFilterAndRefresh({nickname,filter})
  }
  
}

export default PlatformDetails
