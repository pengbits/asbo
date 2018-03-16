import React, {Component} from 'react'

class RemoveWithConfirmLink extends Component {
  render() {
    return (<span style={{
      textDecoration:'underline',
      color: 'red',
      cursor: 'pointer'
    }} onClick={this.destroy.bind(this)}>Delete</span>
    )
  }

  destroy(){
    const {dispatch,dispatchArgs} = this.props;
    confirm('Are you sure?') && dispatch(dispatchArgs)
  }
}

export default RemoveWithConfirmLink