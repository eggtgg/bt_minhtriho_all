import random
import string
dlmax=int(input('nhap gioi han du lieu (MB): '))
while (dlmax<1 or dlmax>1024):
	dlmax = int(input('nhap lại gioi han du lieu (1->1024MB): '))
one_file=1000*1024 #dung lương mỗi file là 1KB
# thực hiện các phép toán quy đổi
m= dlmax*(2**20)//(one_file) #tìm phần nguyên
n= dlmax*(2**20)%(one_file)# lấy phần dư_(kích thước file cuối cùng)
#dãy kí tự ascii viết thường
sstring= string.ascii_lowercase*39385
#nhân lên = số ký tự trong 1 file
def text(): # hàm tạo chua text
    #1 ký tự là một byte
    k=''.join(random.sample(sstring,one_file))
    return k # trả về kết quả của hàm = k
print('số file có kích thước 1KB là: ',m)
print('file cuối cùng có kích thước: ',n/1024,"KB")
for i in range(m): #cho i chạy đến số file 1KB cần tạo
	#tạo file đếm số đuôi là .txt dạng 'w'
	file=open('file'+str(i+1)+'.txt' ,'w')
	file.write(text())#viết lên file đúng 1000*2^10 ký tự
	#tương đương với 1000*2^10 byte =1000KB :D
	file.close()#đóng file lại tránh lag
if n>0: # nếu phần dư >0 tạo thêm 1 file nữa
    file=open('file cuoi cung'+'.txt' ,'w')
    #tương tự ở trên hehe :D
    file.write(''.join(random.sample(sstring,n)))
file.close()
print('done')
#by Minh Tri Ho
