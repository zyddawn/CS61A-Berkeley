""" Lab 3: Recursion and Midterm Review """

def gcd(a, b):
    """Returns the greatest common divisor of a and b.
    Should be implemented using recursion.

    >>> gcd(34, 19)
    1
    >>> gcd(39, 91)
    13
    >>> gcd(20, 30)
    10
    >>> gcd(40, 40)
    40
    """
    #print(a, b)
    if b==0:
        return a
    return gcd(b, a%b)



def hailstone(n):
    """Print out the hailstone sequence starting at n, and return the
    number of elements in the sequence.

    >>> a = hailstone(10)
    10
    5
    16
    8
    4
    2
    1
    >>> a
    7
    """
    cnt = 1
    print(n)
    if n == 1:
        return 1
    elif n%2 == 1:
        return hailstone(3*n+1) + 1 
    else:
        return hailstone(n//2) + 1

    '''
    cnt = 1
    def rec(n):
        nonlocal cnt
        cnt += 1
        print(n)
        if n == 1:
            cnt -= 1
            return ;
        elif n%2 == 1:
            return rec(3*n+1)
        return rec(n//2)
    rec(n)
    return cnt
    '''











