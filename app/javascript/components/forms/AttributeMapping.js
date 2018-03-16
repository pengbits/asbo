import React, {Component} from 'react'
import { Field } from 'redux-form'

export default ({parent,name}) => (
  <tr>
    <td>{name}</td>
    <td>
      <Field 
        component="input" 
        type="text" 
        name={`${parent}.${name}`} 
        placeholder={`${parent}.${name}`}
      />
    </td>
</tr>
)
