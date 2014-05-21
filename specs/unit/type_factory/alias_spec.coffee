Attribute   = require '../../../src/finitio/support/attribute'
TypeFactory = require '../../../src/finitio/support/factory'
AliasType   = require '../../../src/finitio/type/alias_type'
BuiltinType = require '../../../src/finitio/type/builtin_type'
should      = require 'should'
{intType}   = require '../../spec_helpers'

describe 'TypeFactory#alias', ->

  factory = new TypeFactory

  it 'creates an AliasType when not named', ->
    base    = factory.builtin(Number)
    subject = factory.alias(base, "foo")
    should(subject).be.an.instanceof(AliasType)
    should(subject.name).equal('foo')

  it 'creates an AliasType when already named', ->
    subject = factory.alias(intType, "foo")
    should(subject).be.an.instanceof(AliasType)
    should(subject.name).equal('foo')
    should(intType.name).equal('intType')
