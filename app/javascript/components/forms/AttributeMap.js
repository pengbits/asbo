import React, {Component} from 'react'
import { Field } from 'redux-form'
import AttributeMapping from './AttributeMapping'

const AttributeMap = () => (
  <table>
    <thead>
      <tr>
        <th>Property</th>
        <th>Selector</th>
      </tr>
    </thead>
    <tbody>
      <AttributeMapping name='item' />
      <AttributeMapping name='name' />
      <AttributeMapping name='image' />
      <AttributeMapping name='media' />
      <AttributeMapping name='date_str' />
    </tbody>
  </table>
)

export default AttributeMap