import React, {Component} from 'react'

class PlatformList extends Component {
  render() {
    const {platforms} = this.props
    return (<div>
      <h2>Platforms</h2>
      <ul>
        {(platforms || []).map(p => {
          return <li key={p.id}>{p.name}</li>
        })}
      </ul>
    </div>)
  }
}

export default PlatformList
