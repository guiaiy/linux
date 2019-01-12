import random
num=random.randint(1,10000)
answer=int(input('please guess a number:  '))
while 1:
    if answer>num:
        print('bigger')
        answer = int(input('please guess a number:  '))
    elif answer<num:
        print('smaller')
        answer = int(input('please guess a number:  '))
    else:
        print('rigth')
        exit()
