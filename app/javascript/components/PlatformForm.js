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
      <table>
        <thead>
          <tr>
            <th>Property</th>
            <th>Selector</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>item</td>
            <td><TextInput name='attr_map.item' /></td>
          </tr>
          <tr>
            <td>name</td>
            <td><TextInput name='attr_map.name' /></td>
          </tr>
          <tr>
            <td>image</td>
            <td><TextInput name='attr_map.image' /></td>
          </tr>
          <tr>
            <td>media</td>
            <td><TextInput name='attr_map.media' /></td>
          </tr>
          <tr>
            <td>date_str</td>
            <td><TextInput name='attr_map.date_str' /></td>
          </tr>
        </tbody>
      </table>
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
