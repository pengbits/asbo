import React, {Component} from 'react'
import { Field, reduxForm } from 'redux-form'
import TextInput from './forms//TextInput'
import Checkbox from './forms/Checkbox'
import AttributeMap from './forms/AttributeMap'
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
      <AttributeMap />
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
