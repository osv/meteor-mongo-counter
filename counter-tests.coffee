Tinytest = require('tinytest')

Tinytest.add 'mongo-counter delete counters', (test) ->
  deleteCounters('_counters')
Tinytest.add 'mongo-counter inc counters', (test) ->
  test.equal incrementCounter('_counters', 'foo'), 1
  test.equal incrementCounter('_counters', 'foo'), 2
  test.equal incrementCounter('_counters', 'foo'), 3
  test.equal incrementCounter('_counters', 'foo', 10), 13
Tinytest.add 'mongo-counter dec counters', (test) ->
  test.equal decrementCounter('_counters', 'foo'), 12
Tinytest.add 'mongo-counter set counter', (test) ->
  setCounter('_counters', 'foo', 100)
  test.equal incrementCounter('_counters', 'foo'), 101
  test.equal incrementCounter('_counters', 'bar'), 1

Tinytest.add 'mongo-counter set counter again', (test) ->
  setCounter('_counters', 'bar', 100)
  test.equal decrementCounter('_counters', 'bar'), 99
    

Tinytest.add 'mongo-counter run setCounter on fresh collection', (test) ->
  deleteCounters('_counters2')
  setCounter('_counters2', 'bar', 100)
  test.equal decrementCounter('_counters2', 'bar'), 99
 
