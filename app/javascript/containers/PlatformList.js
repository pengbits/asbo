import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import PlatformList from '../components/PlatformList'


const mapStateToProps = (state, ownProps) => {
  console.log(`map state ${JSON.stringify(state)}`)
  return {}
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {}
}

const PlatformListContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PlatformList)

export default PlatformListContainer
