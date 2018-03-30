import React, {Component} from 'react'
import { Field, reduxForm } from 'redux-form'
import TextInput from './forms/TextInput'
import Checkbox from './forms/Checkbox'
import AttributeMap from './forms/AttributeMap'
import {Link} from 'react-router-dom'
import RemoveWithConfirmLink from './RemoveWithConfirmLink'
import Hint from './Hints.js'

class PlatformForm extends Component {
  render() {
    const {initialValues, handleSubmit, pristine, reset, submitting, isNew } = this.props
    const {nickname} = initialValues || {}
    
    return (
      <div className="form-container">
        <form onSubmit={handleSubmit}>
          <h2 className='h2'>{isNew ? 'New' : 'Edit'} Platform</h2>
          <TextInput name='name' />
          <TextInput name='nickname' />
          <TextInput name='url' />       
          <Checkbox name='has_details' />
          <TextInput name='default_image' />
          <AttributeMap 
            parent='attr_map' 
            attrs='item,name,image,media,date_str,details'
          />
          <AttributeMap 
            parent='pagination' 
            attrs='param,url,itemsPerPage'
          />
          <p>
            <button className='btn btn-primary' type="submit" disabled={pristine || submitting}>
              Submit
            </button>
          </p>
        </form>
        {isNew || this.renderOptions({nickname})}
      </div>
    )
  }
  
  renderOptions({nickname}){
    const {isNew,destroyPlatform,initialValues} = this.props

    return (<p className="platform-form__options">
      <RemoveWithConfirmLink 
        dispatch={destroyPlatform} dispatchArgs={{nickname}}
      /><br />
      <Link to={`/platforms/${nickname}`}>Back</Link>
    </p>)
  }
}

export default reduxForm({
  form: 'platform'
})(PlatformForm)
