""" Optional problems for Lab 6 """

## Nonlocal practice
def vending_machine(snacks):
    """Cycles through sequence of snacks.

    >>> vender = vending_machine(('chips', 'chocolate', 'popcorn'))
    >>> vender()
    'chips'
    >>> vender()
    'chocolate'
    >>> vender()
    'popcorn'
    >>> vender()
    'chips'
    >>> other = vending_machine(('brownie',))
    >>> other()
    'brownie'
    >>> vender()
    'chocolate'
    """
    #"*** YOUR CODE HERE ***"
    index = -1
    num_snacks = len(snacks)
    def cycle_snacks():
        nonlocal index
        index = (index+1) % num_snacks
        return snacks[index]
    return cycle_snacks
    

