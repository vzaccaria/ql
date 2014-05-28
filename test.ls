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

    it 'not should return a resolved promise when the original is rejected',  (done) ->
        p = create-rejected-promise()
        np = Q.not p
        np `notifies-on-success` done

    it 'or should resolve when at least one of two promises is resolved' , (done) ->
        p1 = create-rejected-promise()
        p2 = create-resolved-promise()

        Q.or(p1,p2) `notifies-on-success` done

    it 'or should reject when the two promises are both rejected' , (done) ->
        p1 = create-rejected-promise()
        p2 = create-rejected-promise()

        Q.or(p1,p2) `notifies-on-fail` done

          
