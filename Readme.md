
# QL - Q with logic 

This very simple library adds logic operators to compose promises. Operators added: 

* `and` (rejects as soon as one of the input promises is rejected)
* `andSync` (rejects when all promises are completed and at least one of them is rejected)
* `not` 
* `or` (resolves as soon as one of the input promises is resolved.)
* `orSync` (resolves when all promises are completed and at least one of them is resolved.)


**Installation**:

    npm install ql

**Usage**:

The library extends `Q`:

    Q = require('ql');
    ...
    p1 = myAjaxCallReturningAPromise()
    p2 = myOtherCallReturningAPromise()
    ...
    Q.or(p1,Q.not(p2)).then(function() {
        console.log("Either p1 succeeded or p2 failed");
        })

