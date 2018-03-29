import React, {Component} from 'react'
import { Field } from 'redux-form'

const TextInput = ({name}) => (<p>
    <label for='name' className='form__label'>{name}</label>
    <Field 
      component="input" 
      className='form__input'
      type="text" 
      name={name} 
      placeholder={name}
    />
  </p>
)

export default TextInput