# find prime

def primes():
	l = [2, ]
	for i in range(3, 1100):
		flag = True
		for j in range(2, i//2):
			if i%j==0:
				flag = False
				break
		if flag:
			l.append(i)
	return l

L = primes()
print(L)
print("\n")

n = 2018
arr = []
for i in L:
	while n%i==0:
		n = n//i
		print(n, i)
		if len(arr)==0 or arr[-1]!=i:
			arr.append(i)
	if i>(n//2):
		break

print(arr)