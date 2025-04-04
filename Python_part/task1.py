for i in range(0, 3):
    product = input().split(": ")
    product = int(product[1][:-7])
    if product <= 1000:
        print(int(product*0.15))
    elif product > 1000 and product <= 5000:
        print(int(product*0.20))
    else:
        print(int(product*0.25))
