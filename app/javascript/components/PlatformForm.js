import React, {Component} from 'react'
import { Field, reduxForm } from 'redux-form'
import TextInput from './forms//TextInput'
import Checkbox from './forms/Checkbox'
import AttributeMap from './forms/AttributeMap'
import {Link} from 'react-router-dom'
import RemoveWithConfirmLink from './RemoveWithConfirmLink'

class PlatformForm extends Component {
  render() {
    const {initialValues, handleSubmit, pristine, reset, submitting, isNew, destroyPlatform } = this.props
    const {nickname} = initialValues || {}
    
    return (
      <div className="platform-form">
        <form onSubmit={handleSubmit}>
          <h2>{isNew ? 'New' : 'Edit'} Platform</h2>
          <TextInput name='name' />
          <TextInput name='nickname' />
          <TextInput name='url' />       
          <Checkbox name='has_details' />
          <AttributeMap 
            parent='attr_map' 
            attrs='item,name,media,date_str'
            >
            <em>
              Rules for scraping the platform&apos;s html and parsing it into Episodes. Each value/selector is mapped to a property.
            </em>
          </AttributeMap>
          <AttributeMap 
            parent='pagination' 
            attrs='param,url,itemsPerPage'
          >
            <em>pagination settings for the platform. provider either an alternate url or a param to append to the standard url, plus the number of items per page</em>
          </AttributeMap>
          <p>
            <button type="submit" disabled={pristine || submitting}>
              Submit
            </button>
          </p>
        </form>
        <p className="platform-form__options">
          <Link to={`/platforms/${nickname}`}>Back</Link>{' '}|{' '}
          <RemoveWithConfirmLink 
            dispatch={destroyPlatform} dispatchArgs={{nickname}}
          />
        </p>
      </div>
    )
  }
}

export default reduxForm({
  form: 'platform'
})(PlatformForm)
