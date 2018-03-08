import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import PlatformDetails from '../components/PlatformDetails'


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

const PlatformDetailsContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PlatformDetails)

export default PlatformDetailsContainer
