import React, {Component, PropTypes} from 'react'
import { connect } from 'react-redux'
import EpisodeFilter from '../components/EpisodeFilter'
import {setFilter} from '../redux/filter'

const mapStateToProps = (state, ownProps) => {
  const {
    filter
  } = state.episodes

  return {
    filter
  }
}

const mapDispatchToProps = (dispatch, ownProps) => {
  return {}
}

const EpisodeFilterContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(EpisodeFilter)

export default EpisodeFilterContainer
