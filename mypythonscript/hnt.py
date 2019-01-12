# num=int(input("input a number: "))
# def move(n,a,b,c):
#     if n==1:
#         print(a,'-->',c)
#     else:
#         move(n-1,a,c,b)
#         print(a,'-->',c)
#         move(n-1,b,a,c)
# move(num,'A','B','C')
number=[]
num=int(input("input a number: "))

for i in range(2,num+1):
    number.append(i)

for j in range(2,number[-1]+1):
    if len(number)!=0:
       print(number[0],'\t',end='')
       del number[0]
       for k in number:
           if k%j==0:
             number.remove(k)
    else:
        exit()




