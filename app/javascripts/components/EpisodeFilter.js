import React, {Component,createRef} from 'react'
import {debounce} from 'lodash'

class EpisodeFilter extends Component {  
  constructor(props){
    super(props)
    this.setInputRef = (el => this.input = el)
  }
  
  render(){
    const {filter,onSetFilter} = this.props;
    return (<div className='filter'>
        <input 
          className='filter-input'
          type="text" 
          name='filter' 
          placeholder='filter'
          ref={this.setInputRef}
          onChange={debounce(this.handleChange.bind(this), 500)}
          value={filter}
        />
    </div>)
  }
  
  handleChange() {
    const onSetFilter = this.props.onSetFilter
    const filter = this.input.value
    onSetFilter({filter})
  }
}

export default EpisodeFilter


