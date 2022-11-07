# 变量和简单数据类型

## 变量

### Python 变量命名

1. 变量名只能包含字母、数字和下划线。变量名可以字母或下划线打头，但不能以数字打
   头。

2. 变量名不能包含空格，但可使用下划线来分隔其中的单词。

## 字符串

### 字符串大小写的修改（暂时）

1. name.tilte() --- 将name包含的内容首字母大写 

2. name.upper() --- 将name包含的内容全部大写

3. name.lower() --- 将name包男的字母全部小写

### 使用制表符或换行符来添加空白

    \t 制表符，在文本前添加空白

    \n 换行符，在文本后换行

    \n\t 添加换行符和制表符，使得下一行换行并在开头添加一个制表符

### 删除空白（暂时）

1. name.rstrip() --- 将name字符串尾端空白删除

2. name.lstrip() --- 将name字符串首端空白删除

3. name.strip() --- 将name字符串所有空白删除

## 数字

### 使用str()函数避免类型错误

在某些情况下，直接将数字插入到指令中，会让Python难以辨别是数字还是字符，在这种情况下需要使用str()函数告诉Python这是字符串。

```python
age = 23
message = "Happy " + str(age) + "rd Birthday!"
print(message)
```

# 列表

列表基本格式：

```python
bicycles = ['trek', 'cannondale', 'redline', 'specialized']
```

## 列表元素操作

1. 修改列表元素,直接输入替换即可。`xxx[i] = 'xx'`

2. 列表末添加元素`xxx.append('xx')`

3. 在列表中插入元素`xxx.insert(i, 'xx')`, i 是插入的位置

4. 列表删除元素`del()`语句（单纯直接删除），例如`del xxx[i]`（注意`del`之后有空格）

5. `pop()`删除元素（虽然删除，但可以继续使用它的值），原理类似于堆栈，弹出数据。同样，可以弹出任意位置的元素，比如`xxx.pop(i)`。如果你不确定该使用`del`语句还是`pop()`方法，下面是一个简单的判断标准：如果你要从列表中删除一个元素，且不再以任何方式使用它，就使用`del`语句；如果你要在删除元素后还能继续使用它，就使用方法`pop()`。
   
   ```python
   motorcycles = ['honda', 'yamaha', 'suzuki']
   print(motorcycles)
   popped_motorcycle = motorcycles.pop()
   print(motorcycles)
   print(popped_motorcycle)
   输出结果为：
   ['honda', 'yamaha', 'suzuki']
   ['honda', 'yamaha']
   suzuki
   ```

6. 根据值来删除元素，使用`xxx.remove('xx')`。方法remove()只删除第一个指定的值。如果要删除的值可能在列表中出现多次，就需要使用循环来判断是否删除了所有这样的值。

7. 注意事项：在使用`pop()`的时候，如遇到需要打印结果的案例，使用循环函数输出的时候要注意不需要使用`pop(i), i++`，因为**使用了`pop()`函数之后，列表里的数据已经被删除，`pop()`输出的结果已经是从堆栈读取的结果，如果使用递增打印结果，会导致发生输出间隔一个数据的结果**，因此只需要将i设置为定值即可。

## 组织列表

用于保留列表元素最初的排列顺序，或者有需要调整排列顺序。

### 使用sort()对列表永久修改

sort()可以对列表进行排序，并且这种修改是**永久修改**。

**使用方法**：`xxx.sort()`，其中`xxx`是列表名。

```python
cars = ['bmw', 'audi', 'toyota', 'subaru']
cars.sort()
print(cars)
输出结果为：
['audi', 'bmw', 'subaru', 'toyota']
```

同样也可以按照字母顺序相反的顺序排列列表元素，**只需向`sort()`方法传递传递参数`reverse=True`**。

```python
cars = ['bmw', 'audi', 'toyota', 'subaru']
cars.sort(reverse=True)
print(cars)
输出结果为：
['toyota', 'subaru', 'bmw', 'audi']
```

### 使用函数sorted()对列表进行临时排序

要保留列表元素原来的排列顺序，同时以特定的顺序呈现它们，可使用函数`sorted()`。
`sorted()`能够按特定顺序显示列表元素，同时不影响它们在列表中的原始排列顺序。

**使用方法**：`sorted(xxx)`，xxx是列表名。如果你要按与字母顺序相反的顺序显示列表，也可向函数sorted()传递参数`reverse=True`。`sorted(xxx,reverse = True)`

### 倒着打印列表

如有需要反转列表的元素，可使用方法`reverse()`。

**使用方法**：`xxx.reverse()`，其中`xxx`是列表名。

**注意**：`reverse()`是永久性修改列表顺序，但是是可以恢复的，只需要再次使用`reverse()`函数即可。使用时需单独一行，不可以`print (squares.reverse())`

### 确定列表长度`

使用函数`len()`可快速获悉列表的长度。

**使用方法**：`len(xxx)`，xxx是列表名。

**注意**：Python计算列表长度从1开始计算。

# 操作列表

## 创建数值列表

### 使用函数range()创建数字列表

可以创建一系列数字列表：

```python
numbers = list(range(1,6))
print(numbers)
结果如下：
[1, 2, 3, 4, 5]
```

使用函数range()时，还可指定步长。例如，下面的代码打印1~10内的偶数：

```python
even_numbers = list(range(2,11,2))
print(even_numbers)
结果如下：
[2, 4, 6, 8, 10]
```

使用函数range()几乎可以创建任何需要的数字集合，例如：创建列表包含前十个整数的平方，在Python中**代表乘方运算。

```python
squares = []
for value in range(1,11):
    square = value**2
    squares.append(square)
print (squares)
```

### 对数字列表执行简单的统计计算

`min(xxx)`找出最小值

`max(xxx)`找出最大值

`sum(xxx)`求和

### 列表解析

```python
squares = [value**2 for value in range(1,11)]
print(squares)
```

**注意：** `value**2`代表计算平方值，后边的`for循环`用于给表达式提供值，上式中的意思是将`1~10`提供给`value`。

### 切片

用来处理列表部分元素称为切片。

```python
players = ['charles', 'martina', 'michael', 'florence', 'eli']
print(players[0:3])
输出结果为：
['charles', 'martina', 'michael']
```

切片后的输出结果同样也是一个列表。`xxx[:x]`没有指定第一个索引将会自动从列表头开始。同样的方法也可以省略终止索引，如`xxx[x:]`。并且，**负数索引返回离列表末尾相应距离的元素**，因此你可以输出列表末尾的任何切片。例如，如果你要输出名单上的最后三个元素，可使用切片`xxx[-3:]`。

### 复制列表

要复制列表，可创建一个包含整个列表的切片，方法是同时省略起始索引和终止索引([:])。这让Python创建一个始于第一个元素，终止于最后一个元素的切片，即复制整个列表。

```python
my_foods = ['pizza', 'falafel', 'carrot cake']
friend_foods = my_foods[:]
```

## 元组

Python将不能修改的值称为不可变的，而不可变的列表被称为元组。看起来像数组，但是数组是[]，元组是()。

# 字典

## 使用字典

在Python中，字典是一系列键 - 值对。每个键都与一个值相关联，你可以使用键来访问与之
相关联的值。与键相关联的值可以是数字、字符串、列表乃至字典。事实上，可将任Python对象用作字典中的值。在Python中，字典用放在花括号{}中的一系列键 - 值对表示，如前面的示例所示： `alien_0 = {'color': 'green', 'points': 5}`

**使用方法**：`aaa = {'BB': 'bb', 'CC': 'cc'}`，其中`aaa`是字典名，`BB`和`CC`是字典的键，`bb`和`cc`是键值。

### 访问字典中的值

要获取与键相关联的值，可依次指定字典名和放在方括号内的键，如下：

```python
alien_0 = {'color': 'green'}
print(alien_0['color'])
输出结果为：
green
```

### 添加键-值对

字典是一种动态结构，可随时在其中添加键—值对。要添加键—值对，可依次指定字典名、用方括号括起的键和相关联的值。

**使用方法**：`aaa['BB'] = bb`，`aaa`代表字典名，`BB`是字典的键，`bb`是键值。

### 修改字典中的值

要修改字典中的值，可依次指定字典名、用方括号括起的键以及与该键相关联的新值。

**使用方法**：`aaa['BB'] = bb`，`aaa`代表字典名，`BB`是字典的键，`bb`是新的键值。

### 删除键 - 值对

对于字典中不再需要的信息，可使用del语句将相应的键—值对**彻底删除**。

**使用方法**：`del aaa['BB']`

### 遍历字典

`xxx.items()`代表所有的键值对列表，`xxx.keys()`代表遍历所有的键，`xxx.values()`代表遍历字典中的值。

# 用户输入和while循环


