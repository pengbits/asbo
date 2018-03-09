import React, {Component} from 'react'

class PlatformForm extends Component {
  render() {
    const {name,id,url,nickname} = this.props
    return (<form>
      <h2>Platform Details</h2>
      <p>
        <b>name</b><br />
        <input type='text' name='name' value={name} />
      </p>
      <p>
        <b>nickname</b><br />
        {nickname}
        <input type='text' name='nickname' value={nickname} />
      </p>
      <p>
        <b>url</b><br />
        <input type='text' name='url' value={url} />
      </p>
      
    </form>)
  }
}

export default PlatformForm
