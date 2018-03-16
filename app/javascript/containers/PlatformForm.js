import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import PlatformForm from '../components/PlatformForm'
import {createPlatform,updatePlatform,destroyPlatform} from '../redux/platforms'

const mapStateToProps = (state, ownProps) => {  
  const {platform} = state.platforms
  const isNew = (platform || {}).id == undefined

  return {
    initialValues : platform,
    isNew
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    destroyPlatform: ({nickname}) => {
      dispatch(destroyPlatform({nickname}))
    },
    onSubmit: (attrs, dispatch, props) => {
      dispatch(props.isNew ?
        createPlatform(attrs) :
        updatePlatform(attrs)
      )
    }
  }
}

const PlatformFormContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PlatformForm)

export default PlatformFormContainer
