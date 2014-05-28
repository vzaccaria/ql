__q = require('q')

_module = ->

    iface = __q

    iface.and = (promises) -> 

        if not Array.is-array(promises)
            promises := [p for p in &] 

        return __q.all promises

    iface.andSync = (promises) -> 

        __final-and = __q.defer()

        if not Array.is-array(promises)
            promises := [p for p in &] 

        __completed = __q.allSettled promises

        __completed.then -> 
            for res in it 
                if res.state == "rejected"
                    __final-and.reject()
                    return

            __final-and.resolve()

        return __final-and.promise



    iface.not =  ->
        __not = __q.defer()

        p-true = ->
            __not.reject(it)

        p-false = ->
            __not.resolve(it)

        it.then p-true, p-false

        return __not.promise

    iface.or = (promises) ->

        if not Array.is-array(promises)
            return promises  

        __not_or = iface.and [ iface.not(p) for p in promises ]

        return iface.not(__not_or)
  
    return iface
 
module.exports = _module()
