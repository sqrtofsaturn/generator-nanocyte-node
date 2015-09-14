<%= className %> = require '../src/<%= nodeSrc %>'
describe 'OctoModel', ->
  it 'should exist', ->
    expect(<%= className %>).to.exist

  describe 'when constructed', ->
    beforeEach ->
      @sut = new <%= className %>

    it 'should exist', ->
      expect(@sut).to.exist

    it 'should have an onMessage function', ->
      expect(@sut.onMessage).to.exist
