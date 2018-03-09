import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import PlatformForm from '../components/PlatformForm'
import {createPlatform} from '../redux/platforms'

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
    onSubmit: (attrs) => {
      dispatch(createPlatform(attrs))
    }
  }
}

const PlatformFormContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PlatformForm)

export default PlatformFormContainer
