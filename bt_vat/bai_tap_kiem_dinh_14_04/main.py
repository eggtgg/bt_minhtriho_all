from scipy import stats
import numpy as np

# tinh kiem dinh 2 duoi_1 mau
# nhập vào list mẫu theo thứ tự: trung bình mẫu, độ lệch chuẩn, kích thước mẫu
# nhập vào list phát biểu theo: giả thuyết H0, mức ý nghĩa alpha
# so_huong nhận 1 trong 3 giá trị: 'two-sided', 'less', 'greater'
def kiem_dinh_t(mau, phat_bieu, so_huong):
    sample = np.random.normal(mau[0],mau[1],mau[2])
    null_mean = phat_bieu[0]
    alpha = phat_bieu[1]
    ts, pvalue = stats.ttest_1samp(sample, null_mean, alternative=so_huong)
    if (pvalue < alpha):
        print("Có bằng chứng để bác bỏ giả thuyết H0")
    else:
        print("Chưa có bằng chứng để bác bỏ giả thuyết H0")


# tinh kiem dinh 2 duoi_1 mau
# nhập vào list mẫu theo thứ tự: trung bình mẫu, độ lệch chuẩn, kích thước mẫu
# nhập alpha
# so_huong nhận 1 trong 3 giá trị: 'two-sided', 'less', 'greater'
def kiem_dinh_t_2_mau(mau1, mau2, alpha, so_huong):
    sample1 = np.random.normal(mau1[0],mau1[1],mau1[2])
    sample2 = np.random.normal(mau2[0],mau2[1],mau2[2])
    ts, pvalue = stats.ttest_ind(sample1,sample2, alternative=so_huong)
    if (pvalue < alpha):
        print("Có bằng chứng để bác bỏ giả thuyết H0")
    else:
        print("Chưa có bằng chứng để bác bỏ giả thuyết H0")


kiem_dinh_t_2_mau([3.62, 0.1, 15],[3.73, 0.1, 17], 0.01,'two-sided')
kiem_dinh_t([3.62, 0.1, 15],[3.5,0.01],'two-sided')

