p = int(input()) # процент по вкладу
x = int(input()) # вклад (рубли)
y = int(input()) # вклад (копейки)
k = int(input()) # срок

vklad_1 = x * 100 + y

for i in range(k):
    vklag_now = vklad_1 * p / 100
    vklad_1 += int(vklag_now)

rubles = vklad_1 // 100
kopecks = vklad_1 % 100

print(int(rubles), int(kopecks))
