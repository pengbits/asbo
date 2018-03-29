import React, {Component} from 'react'
import { Field } from 'redux-form'

export default ({parent,name}) => (
  <tr>
    <td>
      <em className='form__label'>{name}</em></td>
    <td>
      <Field 
        className="form__input" 
        component="input" 
        type="text" 
        name={`${parent}.${name}`} 
        placeholder={`${parent}.${name}`}
      />
    </td>
</tr>
)
