import os
import random
import string
dlmax=int(input('nhap gioi han du lieu: '))
while (dlmax<1 or dlmax>1024):
	dlmax = int(input('nhap lại gioi han du lieu (1->1024): '))
one_file=1000*1024 #dung lương mỗi file là 1KB
# thực hiện các phép toán quy đổi
m= dlmax*(2**20)//(one_file) #tìm phần nguyên
n= dlmax*(2**20)%(one_file)# lấy phần dư_(kích thước file cuối cùng)
#dãy kí tự ascii viết thường
sstring= string.ascii_lowercase
print('số file có kích thước 1KB là: ',m)
print('file cuối cùng có kích thước: ',n/1024,"KB")
for i in range(m): #cho i chạy đến số file 1KB cần tạo
	#tạo file đếm số đuôi là .txt dạng 'w'
	file=open('file'+str(i+1)+'.txt' ,'w')
	for i in range(one_file): #mỗi kí tự ascii tương ứng 1 byte
		#viết lên file
	    file.write(random.choice(sstring))
	file.close()#đóng file lại tránh lag
if n>0: # nếu phần dư >0 tạo thêm 1 file nữa
    file=open('file cuoi cung'+'.txt' ,'w')
    for i in range(n): # viết vào file cuối
	    file.write(random.choice(sstring))
file.close()
#done
#by Minh Tri Ho
