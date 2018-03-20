import React, { Component } from 'react';
import { render } from 'react-dom';
import '../scss/style.scss';

export default class Hello extends Component {
  render() {
    return (
      <div>
        Hello from react
      </div>
    );
  }
}

render(<Hello />, document.getElementById('root'));