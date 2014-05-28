(function(){
  var __q, _module;
  __q = require('q');
  _module = function(){
    var iface;
    iface = __q;
    iface.and = function(){
      return __q.allSettled(arguments);
    };
    iface.not = function(it){
      var __not, pTrue, pFalse;
      __not = __q.defer();
      pTrue = function(it){
        return __not.reject(it);
      };
      pFalse = function(it){
        return __not.resolve(it);
      };
      it.then(pFalse, pTrue);
      return __not.promise;
    };
    iface.or = function(promises){
      var __not_or, p;
      if (!Array.isArray(promises)) {
        return promises;
      }
      __not_or = iface.and((function(){
        var i$, ref$, len$, results$ = [];
        for (i$ = 0, len$ = (ref$ = promises).length; i$ < len$; ++i$) {
          p = ref$[i$];
          results$.push(iface.not(p));
        }
        return results$;
      }()));
      return iface.not(__not_or);
    };
    return iface;
  };
  module.exports = _module();
}).call(this);
