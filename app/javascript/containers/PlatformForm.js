import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import PlatformForm from '../components/PlatformForm'


const mapStateToProps = (state, ownProps) => {  
  // const {platform} = state.platforms 
  // const {
  //   name,
  //   nickname,
  //   id,
  //   url
  // } = platform || {}
  // return {name,nickname,id,url}
  return {}
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    onSubmit: (form) => {
      console.log(`onSubmit ${JSON.stringify(form)}`)
    }
  }
}

const PlatformFormContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PlatformForm)

export default PlatformFormContainer
