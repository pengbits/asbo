import React, {Component} from 'react'

class PlatformDetails extends Component {
  render() {
    const {name,id,url,nickname,loading} = this.props
    return loading ? <p>...</p> : ( <div>
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
      
    </div>)
  }
}

export default PlatformDetails
