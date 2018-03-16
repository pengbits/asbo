import React, {Component} from 'react'
import { Field, reduxForm } from 'redux-form'

const Hints = {
  'attr_map' : (<em>
    Rules for scraping the platform&apos;s html and parsing it into Episodes. Each value/selector is mapped to a property.
  </em>),
  'pagination' : (<em>
    pagination settings for the platform. provider either an alternate url or a param to append to the standard url, plus the number of items per page
  </em>)
}

export default ({component}) => {
  return Hints[component]
}
