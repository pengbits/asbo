import React, {Component} from 'react'

class EpisodeFilter extends Component {  
  render(){
    return (<div className='filter'>
        <input 
          className='filter-input'
          type="text" 
          name='filter' 
          placeholder='filter'
          onChange={this.onChange.bind(this)}
        />
    </div>)
  }
  
  onChange(e) {
    const filter = e.currentTarget.value
    const {setFilter} = this.props
    setFilter({filter})
  }
}

export default EpisodeFilter


