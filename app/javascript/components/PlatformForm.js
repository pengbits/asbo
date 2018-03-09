import React, {Component} from 'react'
import { Field, reduxForm } from 'redux-form'

class PlatformForm extends Component {
  render() {
    const { handleSubmit, load, pristine, reset, submitting } = this.props
    return (<form onSubmit={handleSubmit}>
      <h2>New Platform</h2>
      <p>
        <b>name</b><br />
        <Field 
          component="input" 
          type="text" 
          name="name" 
          placeholder="name"
        />
      </p>
      <p>
        <b>nickname</b><br />
        <Field 
          component="input" 
          type="text" 
          name="nickname"  
          placeholder="name"
        />
      </p>
      <p>
        <b>url</b><br />
        <Field 
          component="input" 
          type="text" 
          name="url"  
          placeholder="url"
        />
      </p>      
      <p>
        <button type="submit" disabled={pristine || submitting}>
          Submit
        </button>
        </p>
    </form>)
  }
}

export default reduxForm({
  form: 'platform'
})(PlatformForm)
