import React, {Component} from 'react'

class EpisodeFilter extends Component {  
  render(){
    const {filter} = this.props;
    return (<div className='filter'>
        <input 
          className='filter-input'
          type="text" 
          name='filter' 
          placeholder='filter'
          onChange={this.handleChange.bind(this)}
          value={filter}
        />
    </div>)
  }
  
  handleChange(e) {
    const filter = e.currentTarget.value
    const {onSetFilter} = this.props
    onSetFilter({filter})
  }
}

export default EpisodeFilter


