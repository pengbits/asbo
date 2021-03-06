import React, {Component} from 'react'
import { Field } from 'redux-form'
import AttributeMapping from './AttributeMapping'

const AttributeMap = ({parent,attrs,children}) => (
  <div className="platform-attribute-map">
    <h4 className='h4'>{parent}</h4>
    <p>{children}</p>
    <table>
      <thead>
        <tr>
          <th>prop</th>
          <th>value</th>
        </tr>
      </thead>
      <tbody>
        {(attrs||'').split(',')
          .map((attr,i) => <AttributeMapping 
            key={i} 
            parent={parent} 
            name={attr} 
          />)
        }
      </tbody>
    </table>
  </div>
)

export default AttributeMap