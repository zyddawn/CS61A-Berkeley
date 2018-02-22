def announce_highest(who, previous_high=0, previous_score=0):
    """Return a commentary function that announces when WHO's score
    increases by more than ever before in the game.

    >>> f0 = announce_highest(1) # Only announce Player 1 score gains
    >>> f1 = f0(11, 0)
    >>> f2 = f1(11, 1)
    1 point! That's the biggest gain yet for Player 1
    >>> f3 = f2(20, 1)
    >>> f4 = f3(5, 20) # Player 1 gets 4 points, then Swine Swap applies
    19 points! That's the biggest gain yet for Player 1
    >>> f5 = f4(20, 40) # Player 0 gets 35 points, then Swine Swap applies
    20 points! That's the biggest gain yet for Player 1
    >>> f6 = f5(20, 55) # Player 1 gets 15 points; not enough for a new high
    """
    assert who == 0 or who == 1, 'The who argument should indicate a player.'
    # BEGIN PROBLEM 7
    def say(*score):   # score contains 2 values
        nonlocal previous_score, previous_high  # fancy!!!
        cur_score = score[who]              
        cur_high = cur_score - previous_score
        if cur_high > previous_high:
            plurality = "s"
            if cur_high <= 1:
                plurality = ""
            print("{0} point{1}! That's the biggest gain yet for Player {2}".format(cur_high, plurality, who))
            return announce_highest(who, cur_high, cur_score)
        return announce_highest(who, previous_high, cur_score)
    return say


if __name__=='__main__':
    f0 = announce_highest(1)
    input("next..")
    f1 = f0(11, 0)
    input("next..")
    f2 = f0(11, 1)
    input("next..")
    f3 = f2(20, 1)
    input("next..")
    f4 = f3(5, 20)
    input("next..")
    f5 = f4(20, 40)
    input("next..")
    f6 = f5(20, 55)


