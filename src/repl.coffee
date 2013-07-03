# Repl for lispy

lispy = require('./lispy')
sys = require("sys")

stdin = process.openStdin()
stdin.setEncoding('utf8')

write = (s) -> process.stdout.write(s)
prompt = (name='lispy') -> write(name + '> ')

stdin.on 'data', (data) ->
  try
    s = String(lispy.eval(data) + '\n')
    write(s) and prompt()
  catch e
    write(String(e) + '\n') and prompt()
    
stdin.on 'end', -> write('\nGoodbye\n')

prompt()
