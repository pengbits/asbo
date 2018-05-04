import React, {Component} from 'react'


class Media extends Component {
  
  render(){
    const {
      embed
    } = this.props
    
    // obv kinda shaky to just dump the snippet from a 3rd party api into our app
    if(embed && embed.html){
      return <div dangerouslySetInnerHTML={{__html: embed.html}} />
    } else {
      return null
    }
    
  }
}

export default Media