def d1 = '15-' + args[0] 
def d2  = '15-' + args[1] 
def beginning = Date.parse('yy-MMM-dd HH:mm:ss.S', d1).time as BigInteger
def ending = Date.parse('yy-MMM-dd HH:mm:ss.S', d2).time as BigInteger

def delta = ending - beginning 

def period( delta ) {
    def hours = 0
    def mins = 0
    def (secs,millis) = delta.divideAndRemainder(1000)
     
    if( secs >= 60 ) {
        (mins,secs) = secs.divideAndRemainder(60)
        
        if( mins >= 60 ) {
            (hours,mins) = mins.divideAndRemainder(60)
        }
    }

    "$hours:$mins:$secs"
}

print "${args[0]}\t${args[1]}\t${period(delta)}\t${delta}" 
