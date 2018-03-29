import React, {Component} from 'react'
import { Field } from 'redux-form'

const Checkbox = ({name}) => (<p>
  <b>Has Details</b>{' '}
  <Field 
    name={name} 
    component='input' 
    type='checkbox'
  />
</p>
)

export default Checkbox