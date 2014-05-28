
# QL - Q with logic 

This very simple library adds logic operators to compose promises. Operators added: 

* `and` (synonym for Q.settleAll)
* `not` 
* `or`

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
