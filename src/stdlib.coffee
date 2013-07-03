_ = require './underscore'
utils = require './utils'
sum = (args...) -> _.reduce(args, (total, val) -> total + val)
minus = (args...) -> _.reduce(args, (total, val) -> total - val)
multiply = (args...) -> _.reduce(args, (total, val) -> total * val)
divide = (args...) -> _.reduce(args, (total, val) -> total / val)

# Greater than and less than
gt = (args...) -> _.reduce(args, (total, val) -> total > val)
gteq = (args...) -> _.reduce(args, (total, val) -> total >= val)
lt = (args...) -> _.reduce(args, (total, val) -> total < val)
lteq = (args...) -> _.reduce(args, (total, val) -> total <= val)
equal = (args...) -> _.uniq(args).length is 1

type = (arg) -> arg.constructor.name
arr = (args...) -> args
obj = (args...) -> 
  keys=[]
  vals=[]
  
  for val, i in args
    if (i%2 == 0)
      keys.push args[i]
    else
      vals.push args[i]
  o = utils.createobj keys, vals

get = (args...) -> _.reduce(args, (key, obj) -> obj[key])
set = (key, val, obj) -> obj[key] = val

exports.get = get
exports.set = set
exports.arr = arr
exports.obj = obj
exports.type = type

exports.sum = sum
exports.minus = minus
exports.multiply = multiply
exports.divide = divide
exports.gt = gt
exports.lt = lt
exports["equal?"] = equal

# Add symbols
exports["+"] = sum
exports["-"] = minus
exports["*"] = multiply
exports["/"] = divide
exports[">"] = gt
exports[">="] = gteq
exports["<"] = lt
exports["<="] = lteq
exports["="] = equal
