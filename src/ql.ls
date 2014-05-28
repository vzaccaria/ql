__q = require('q')

_module = ->

    iface = __q

    iface.and = -> __q.allSettled & 

    iface.not =  ->
        __not = __q.defer()

        p-true = ->
            __not.reject(it)

        p-false = ->
            __not.resolve(it)

        it.then p-false, p-true

        return __not.promise

    iface.or = (promises) ->

        if not Array.is-array(promises)
            return promises  

        __not_or = iface.and [ iface.not(p) for p in promises ]

        return iface.not(__not_or)
  
    return iface
 
module.exports = _module()
