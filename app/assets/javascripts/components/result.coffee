@Result = React.createClass
  getDefaultProps: ->
    result: {}

  render: ->
    React.DOM.div null,
      React.DOM.h3
        className: 'result-content'
        @props.result.content