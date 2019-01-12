import getpass
user=input('please input username: ')
if user=='bob':
    passwd=getpass.getpass('please input passwd: ')
    if passwd=='123456':
        print('Login successful')
    else:
        print('Login incorrect')
else:
    print('Login incorrect')
