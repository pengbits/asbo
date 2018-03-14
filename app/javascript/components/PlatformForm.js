import React, {Component} from 'react'
import { Field, reduxForm } from 'redux-form'
import TextInput from './forms//TextInput'
import Checkbox from './forms/Checkbox'
class PlatformForm extends Component {
  render() {
    const {load, handleSubmit, pristine, reset, submitting, isNew } = this.props
    return (
      <form onSubmit={handleSubmit}>
      <h2>{isNew ? 'New' : 'Edit'} Platform</h2>
      <TextInput name='name' />
      <TextInput name='nickname' />
      <TextInput name='url' />       
      <Checkbox name='has_details' />
      <p>
        <b>Attribute Map</b><br />
        <Field
          name="attr_map" 
          component="textarea" 
          style={{
            'fontFamily':'courier new, monospace'
          }}
          cols={100}
          rows={10}
          format={(value,name) => (JSON.stringify(value, null, 2))}
           parse={(value,name) => (JSON.parse(value))}
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
