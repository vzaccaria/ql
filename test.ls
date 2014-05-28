require! 'should'
__q = require('q')

notifies-on-fail = (p, cb) ->
    p.then((-> cb(it)),(-> cb()))

notifies-on-success = (p, cb) ->
    p.then((-> cb()), (-> cb(it)))

create-resolved-promise = ->
    d = __q.defer()
    p = d.promise   
    d.resolve()
    return p


create-rejected-promise = ->
    d = __q.defer()
    p = d.promise   
    d.reject()
    return p

Q = require('./index.js')

describe 'QL', (empty) ->

    it 'not should return a failed promise when the original is resolved',  (done) ->
        p = create-resolved-promise()
        np = Q.not p
        np `notifies-on-fail` done
    
