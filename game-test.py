import random
secret = random.randint(1,10)#生成一个随机数
print('......"我爱鱼c工作室"......')
print("......\"我爱鱼c工作室\"......")
times = 1
temp =input("不妨猜一下小甲鱼现在心里想的是哪个数字：")
guess = int (temp)
if guess == secret:
    print("wocao,你是小甲鱼心里的蛔虫吗？！")
    print("wuqing，哼，猜中了也没有奖励！")
else:
    if guess < secret:
        print("哎呀，猜小啦")
        times = times + 1
    else:
        print("哎呀，猜大啦")
        times = times + 1
    while times < 4:
        temp =input("再试一次吧：")
        guess = int (temp)
        if guess == secret:
            print("wocao,你是小甲鱼心里的蛔虫吗？！")
            print("wuqing，哼，猜中了也没有奖励！")
            times = 5
        else:
            if guess < secret:
                print ("猜小啦")
            else:
                print ("猜大啦")
        times = times + 1
print ('正确答案是:')
print(secret)
print ("游戏结束，不玩啦")
