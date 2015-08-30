@Result = React.createClass

  getDefaultProps: ->
    result: {}

  render: ->
    React.DOM.div
      className: 'row'
      React.DOM.div
        className: 'col-sm-12'
        React.DOM.h3
          className: 'result-title'
          @props.result.title
        React.DOM.h6
          className: 'result-album-title'
          @props.result.album_title
        React.DOM.h6
          className: 'result-artist-name'
          @props.result.artist_name