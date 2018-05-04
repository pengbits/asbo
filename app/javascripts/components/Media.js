import React, {Component} from 'react'
//https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/438286137&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true

class Media extends Component {
  
  componentWillMount() {
    const {initMedia} = this.props
    console.log(`componentWillMount`)
    // initMedia()
  }
  
  render(){
    const {
      url,
      src
    } = this.props
    
    return (<iframe width="100%"
      height="166"
      scrolling="no"
      frameborder="no"
      allow="autoplay"
      src=""></iframe> 
    ) 
  }
}

export default Media