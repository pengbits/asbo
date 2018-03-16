import React, {Component} from 'react'

const getEntries = (map) => {
  return Object.entries(map).map(([prop,value]) => {
    return (
      <tr key={prop}>
        <td>{prop}</td>
        <td>{value}</td>
      </tr>
    )
  })
}

export default ({map}) => {
  return(<div>
    <table border='1' cellPadding="5" style={{
      'borderCollapse':'collapse',
      'fontFamily':'Consolas,Courier New,monospace',
      'fontSize':12
    }}>
      <thead>
        <tr>
          <th>Key</th>
          <th>Value</th>
        </tr>
      </thead>
      <tbody>{getEntries(map)}</tbody>
    </table>
  </div>
  )
}