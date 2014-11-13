# -*- coding: utf-8 -*-
"""
Created on Fri Oct 24 00:58:34 2014

@author: nanguiano
"""
import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Perform several \
        trivial mathematical operations")
    
    parser.add_argument("x", help="first argument",type=int)     
    parser.add_argument("y", help="second argument",type=int)
    
    parser.add_argument("-a", "--add", help="perform an addition",action="store_true")    
    parser.add_argument("-s", "--subtraction", help="perform a subtraction",action="store_true")    
    parser.add_argument("-m", "--multiply", help="perform a multiplication",action="store_true")
    parser.add_argument("-d", "--division", help="perform a division",action="store_true")
    parser.add_argument("-v", "--verbose", help="perform a multiplication",action="store_true")
    
    args  = parser.parse_args()
    x = args.x
    y = args.y

    if args.multiply:
        if args.verbose:
            print "Multiplying {} and {} = {}".format(x, y, x*y)
        else:
            print x * y
            
    elif args.add:
        if args.verbose:
            print "Adding {} and {} = {}".format(x, y, x+y)
        else:
            print x + y
            
    elif args.subtraction:
        if args.verbose:
            print "Substracting {} from {} = {}".format(y, x, x-y)
        else:
            print x - y
    
    elif args.division:
        if args.verbose:
            print "Dividing {} by {} = {}".format(x, y, x / y)
        else:
            print x / y
     