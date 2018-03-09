import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import PlatformForm from '../components/PlatformForm'


const mapStateToProps = (state, ownProps) => {  
  const {platform} = state.platforms 
  const {
    name,
    nickname,
    id,
    url
  } = platform || {}
  return {name,nickname,id,url}
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {}
}

const PlatformFormContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PlatformForm)

export default PlatformFormContainer
