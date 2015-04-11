# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    #listener for stand event

    # calls dealer functionality
    (@get 'playerHand').on 'stand', (->
      (@get 'dealerHand').first().flip()

      dealer = @get 'dealerHand'

      control = true
      while control
       if dealer.scores()[1] < 17
          dealer.hit()
        else if dealer.scores()[1] <= 21
          @resolved()
          control = false
        else if dealer.scores()[0] < 17
          dealer.hit()
        else if dealer.scores()[0] <= 21
          @resolved()
          control = false
        else
          alert "Dealer Busts! You win!"
          @trigger "bust"
          new AppView(model: new App()).$el.appendTo 'body'
          control = false
      ), @

    (@get "playerHand").on 'bust', (->
      alert "Bust! You Lose!"
      @trigger 'bust'
      new AppView(model: new App()).$el.appendTo 'body'
      ), @


  resolved: ->
    dealerScore = if (@get 'dealerHand').scores()[1] <= 21 then (@get 'dealerHand').scores()[1] else (@get 'dealerHand').scores()[0]
    playerScore = if (@get 'playerHand').scores()[1] <= 21 then (@get 'playerHand').scores()[1] else (@get 'playerHand').scores()[0]

    winner = if dealerScore > playerScore then 'Dealer' else 'You'
    alert winner

