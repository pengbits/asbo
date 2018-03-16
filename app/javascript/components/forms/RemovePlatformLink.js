import React, {Component} from 'react'

class RemovePlatformLink extends Component {
  render() {
    return (<span style={{
      textDecoration:'underline',
      cursor: 'pointer'
    }} onClick={this.destroy.bind(this)}>Delete</span>
    )
  }

  destroy(){
    const {destroyPlatform,nickname} = this.props;
    confirm('Permanently delete this platform?') && destroyPlatform({nickname})
  }
}

export default RemovePlatformLink