import React, { Component } from 'react';
import { render } from 'react-dom';
import '../scss/style.scss';
import logo from '../logo.svg'

export default class Hello extends Component {
  render() {
    return (
      <div>
        Hello from react
        
        <img src={ logo } alt='showteeezy ' />
      </div>
    );
  }
}

render(<Hello />, document.getElementById('root'));