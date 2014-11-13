
# coding: utf-8

# ##Sieve of Eratosthenes

# In[20]:

import sys
import numpy as np
def sieveOfEratosthenes(n):
    """sieveOfEratosthenes(n): return the list of the primes < n."""
    # Code from: <dickinsm@gmail.com>, Nov 30 2006
    # http://groups.google.com/group/comp.lang.python/msg/f1f10ced88c68c2d
    if n <= 2:
        return []
    sieve = range(3, n, 2)
    top = len(sieve)
    for si in sieve:
        if si:
            bottom = (si*si - 3) / 2
            if bottom >= top:
                break
            sieve[bottom::si] = [0] * -((bottom - top) / si)
    return np.array([2] + [el for el in sieve if el])


# In[26]:

if __name__ == '__main__':
    if len(sys.argv)!=2:
           print 'One Argument is mandatory'
    else:
           n = sys.argv[1] 
           print 'List of primes numbers <', n 
           print sieveOfEratosthenes(int(n))

# In[ ]:



