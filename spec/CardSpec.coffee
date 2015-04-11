assert = chai.assert

describe "deck constructor", ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()


  it "should create a card collection", ->
    assert.strictEqual deck.length, 52

  it "should instantiate a player hand with 2 cards", ->
    player = deck.dealPlayer()
    assert.strictEqual player.length, 2



  it "should instantiate a dealer hand with 1 flipped card and 1 visible card", ->
    dealer = deck.dealDealer()

    assert.strictEqual dealer.first().get('revealed'), false
    assert.strictEqual dealer.last().get('revealed'), true


