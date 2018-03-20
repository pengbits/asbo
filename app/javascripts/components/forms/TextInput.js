import React, {Component} from 'react'
import { Field } from 'redux-form'

const TextInput = ({name}) => (<p>
    <b>{name}</b>
    <br />
    <Field 
      component="input" 
      type="text" 
      name={name} 
      placeholder={name}
    />
  </p>
)

export default TextInput