assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      stupid = deck.last()
      hand.hit()
      assert.strictEqual stupid, hand.last()
      assert.strictEqual deck.length, 49

  describe 'scores', ->
    it 'should have two different scores if ace is present', ->
      hand.add(new Card({rank: 1}))
      assert.strictEqual ((hand.scores()[0]) == (hand.scores()[1])), false

    it 'minScore should always represent the first score in Scores', ->
      hand.add(new Card({rank: 1}))
      assert.strictEqual ((hand.scores()[0]) == (hand.minScore())), true
      assert.strictEqual ((hand.scores()[1]) == (hand.minScore())), false

  describe 'hasAce', ->
    it 'should return 0 if no ace is present', ->
      hander = new Hand [new Card({rank: 5}), new Card({rank:6})], @
      assert.strictEqual hander.hasAce(), false

    it 'should return 1 if an ace is present', ->
      hand.add(new Card({rank:1}))
      assert.strictEqual hand.hasAce(), true


###
  describe 'bust', ->
    it 'should bust if score is over 21'
      while hand.minScore() <= 21
        hand.hit()

      #bust should hae been called
###
