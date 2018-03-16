import React, {Component} from 'react'
import { Field, reduxForm } from 'redux-form'
import TextInput from './forms//TextInput'
import Checkbox from './forms/Checkbox'
import AttributeMap from './forms/AttributeMap'
import {Link} from 'react-router-dom'

class PlatformForm extends Component {
  render() {
    const {initialValues, handleSubmit, pristine, reset, submitting, isNew } = this.props
    const {nickname} = initialValues || {}
    
    return (
      <div className="platform-form">
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
        </form>
        <p className="platform-form__options">
          <Link to={`/platforms/${nickname}`}>Back</Link>{' '}|{' '}
        </p>
      </div>
    )
  }
}

export default reduxForm({
  form: 'platform'
})(PlatformForm)
