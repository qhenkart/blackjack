class window.AppView extends Backbone.View
  template: _.template '<div class="container">
    <div class="buttons"><button class="hit-button">Hit</button> <button class="stand-button">Stand</button></div>
    <div class="dealer-hand-container"></div>
    <div class="player-hand-container"></div></div>
  '

  events:
    'click .hit-button': ->
      if !@model.standing
        @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    @model.on "refresh", =>
      @$el.html('')
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

