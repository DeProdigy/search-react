@Result = React.createClass

  getDefaultProps: ->
    result: {}

  render: ->
    React.DOM.div
      className: 'col-xs-12 col-md-4 result'
      React.DOM.h3
        className: 'result-title result-description'
        @props.result.title
      React.DOM.h6
        className: 'result-album-title result-description'
        @props.result.album_title
      React.DOM.h6
        className: 'result-artist-name result-description'
        @props.result.artist_name