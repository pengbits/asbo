import React, {Component} from 'react'

class PlatformDetails extends Component {
  render() {
    const {name} = this.props
    return (<div>
      <h2>Platform {name}</h2>
      <p>x</p>
    </div>)
  }
}

export default PlatformDetails
