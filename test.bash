#!/data/data/com.termux/files/usr/bin/bash

. ./console.source
. ./logger.source
. ./word.source
. ./test.source


filename='ss.b.jndi.create'
printTitle "TestCase ${filename}" ${COLOR[yellow]}
assertEquals '  leftWord' 'ss' $(leftWord ${filename})
assertEquals 'middleWord' 'b.jndi' $(middleWord ${filename})
assertEquals ' rightWord' 'create' $(rightWord ${filename})
assertEquals 'nthWord  1' 'ss' $(nthWord ${filename} 1)
assertEquals 'nthWord -2' 'jndi' $(nthWord ${filename} -2)
assertEquals 'nthWord -1' 'create' $(nthWord ${filename} -1)
assertEquals '   nthWord' 'ss' $(nthWord ${filename})
assertEquals 'nthWord  5' '' $(nthWord ${filename} 5)
assertEquals 'nthWord -7' 'ss.b' $(nthWord ${filename} -7)

filename='ss-b-jndi-create'
printTitle "TestCase ${filename}" ${COLOR[yellow]}
assertEquals '  leftWord' 'ss' $(leftWord ${filename} '-')
assertEquals 'middleWord' 'b-jndi' $(middleWord ${filename} '-')
assertEquals ' rightWord' 'create' $(rightWord ${filename} '-')
assertEquals 'nthWord  1' 'ss' $(nthWord ${filename} 1 '-')
assertEquals 'nthWord -2' 'jndi' $(nthWord ${filename} -2 '-')
assertEquals 'nthWord -1' 'create' $(nthWord ${filename} -1 '-')
assertEquals '   nthWord' 'ss' $(nthWord ${filename} '' '-')
assertEquals 'nthWord  5' '' $(nthWord ${filename} 5 '-')
assertEquals 'nthWord -7' 'ss-b' $(nthWord ${filename} -7 '-')

console_demo
loggerDemo