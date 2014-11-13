
# coding: utf-8

# ##Sieve of Eratosthenes


import argparse

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



if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Calculate prime numbers until n")
    parser.add_argument("n", help="return primes until n",type=int)
    parser.add_argument("-v", "--verbose", action="store_true",
                    help="increase output verbosity")
    args  = parser.parse_args()
    n = args.n
    answer = sieveOfEratosthenes(n)
    if args.verbose:
        print "List of primes numbers < {} is: \n{}".format(args.n, answer)
    else:
        print answer
    print  
   



