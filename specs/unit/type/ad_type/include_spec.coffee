AdType      = require '../../../../src/finitio/type/ad_type'
should      = require 'should'

describe "AdType#include", ->

  type = new AdType(Date, [])

  it 'when not included', ->
    type.include("12").should.equal(false)

  it 'when included', ->
    type.include(new Date()).should.equal(true)
