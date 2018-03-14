import React, {Component} from 'react'
import { Field } from 'redux-form'

export default ({name}) => (
  <tr>
    <td>{name}</td>
    <td>
      <Field 
        component="input" 
        type="text" 
        name={`attr_map.${name}`} 
        placeholder={`attr_map.${name}`}
      />
    </td>
</tr>
)
