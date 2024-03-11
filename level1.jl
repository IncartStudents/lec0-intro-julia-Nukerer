# переписать ниже примеры из первого часа из видеолекции: 
# https://youtu.be/4igzy3bGVkQ
# по желанию можно поменять значения и попробовать другие функции

a = "Добрый день!"
println(a)
b = """Добрый "день"!"""
println(b)

my_answer = 52
println("my_answer type is: ", typeof(my_answer))

my_pi = 3.14
println("my_pi type is: ", typeof(my_pi))

my_name = "Никита"
println("my_name type is: ", typeof(my_name))

my_answer = my_name
println("my_answer type is: ", typeof(my_answer))

#комментирую комментирую

#=
комментирую многострочно
комментирую многострочно
=#

println(
  5 + 2,' ',
  3 - 4, ' ',
  100 * 100, ' ',
  25 / 5, ' ',
  5^2, ' ',
  100 % 2)


#строки
println(typeof('a'))

my_age = 20
println("Привет, меня зовут $my_name, мне $my_age лет") 
println("число pi плюс мой возраст будет равняться $(my_pi + my_age)")

#сложение строк
println(string("хочу сложить эту строку", "и эту строку"))

println(string("хочу сложить эту строку, число ", 78, " и эту строку"))

println(a*my_name)
println("$a$my_name")

#структура данных
##словари
phonebook = Dict("Nikita" => "7355608", "Vadya" => "525678")
println(phonebook)

#добавить значения в словарь
phonebook["Karl Mraks"] = "785456"
println(phonebook["Karl Mraks"])

#удалить значения из словария
pop!(phonebook, "Vadya")
println(phonebook)

#кортежи
my_tuple = (1, 2, 3, 4, 5)
println(my_tuple[1]) #индексация начинается не с 0, а с 1. Кортежи - неизменяемый тип данных

#массивы(списки, полчается)
list_1 = ["Sasha", "Tanya", ["Vitya", "Vasya"], 1 , 5, 3.14]
println(list_1[3])
list_1[2] = "Vitalya" 
println(list_1)


#добавление и удаление элементов листа
push!(list_1, "Kolya", 52)
println(list_1)
pop!(list_1) #удаляет последний добавленный элемент
println(list_1)

#массив, размера n*m заполненный случайными числами от 0 до 1
println(rand(3, 2)) #если есть 3й аргумент - количество массивов

#цикл while
#n = 0
#while n > 10
#  n += 1
#  println(n)
#end

friend = ["Sasha", "Tanya", "Vitya", "Vasya"]
#i = 1
#while i != length(list_1)
#  fr = friend[i]
#  println("Hello, $fr")
#  i += 1
#end

#цикл for
for n in 1:10 # in можно менять на = или какой-то смешной знак
  println(n)
end

for fr in friend
  println("Hello, $fr")
end

x, y = 5, 5
mat = zeros(x, y)
for i in 1:x #эту и следующую строчку можно заменить на for i = 1:x, j in 1:y
  for j in 1:y
    mat[i, j] = i + j
  end
end
println(mat)

mat1 = [i + j for i in 1:x, j in 1:y] #самый крутой способ
println(mat1)


#таблицы сложения, увеличивающиеся с каждой итерацией
for n in 1:3
  mat3 = [i + j for i in 1:n, j in 1:n]
  display(mat3)
end

#оператр if else
x = 5
y = 2
if x > y
  println("$x больше $y")
elseif x < y
  println("$x меньше $y")
else
  println("$x равно $y")
end

#возвращает наибольшее значение переменной
if x > y
  x
elseif x < y
  y
end

(x > y) ? x : y #то же самое, что и выше, но очень красиво и в 1 строчку

(x > y) && println("$x больше $y") #&& - логическое И. Больше никаких условий не проверяется
(x < y) && println("$x меньше $y") #соответственно, вернет false

#функции
function sayhi(name)
  println("Hello, $name")
end
println(sayhi("Vitya"))

function f(x)
  x^2
end
println(f(2))

#второй способ задать те же функции
f2(x) = x^2
sayhi2(name) = println("Hello, $name")

#lambda функция
f3 = x -> x^2
sayhi3 = name -> println("Hello, $name")

#функции работают с любыми аргументами
sayhi3(3784850723)
println(f3(mat)) # матрицу можно возвести в квадрат

#НО, если на вход f подать вектор, вылезет ошибка, тк такой операции не существует 

#мутирующие функции изменяют входные данные, а немутирующие - нет. у мутирующих в конце названия ставится !:

v = [6, 8, 7, 5]
sort(v) #сама переменная v не изменится
println(v)
sort!(v) #а тут изменится
println(v)

#вещание(?). обозначается точкой после названия функции.
f(mat) #функция f выполняется к матрице mat
f.(mat) # а тут к каждому элементу этой матрицы поотдельности

#библиотеки
#Pkg.add("Пример") - синтаксис добавления новой библиотеки
#using Example - использовать библиотеку


#графики
#можно использовать питоновский PyPlot
import Pkg
Pkg.add("Plots")
using Plots
x = -3:0.1:3
y = f.(x)
gr()
plot(x, y, label="line")
scatter!(x, y, label="points")
xflip!() #поменять оси местами
xlabel!("x") #подписи к осям
ylabel!("y")
title("Заголовок") #название графика
#несколько графиков на одном экране
p1 = plot(x, x)
p2 = plot(x, x.^2)
p3 = plot(x, x.^3)
p4 = plot(x, x.^4)
plot(p1, p2, p3, p4, layout=(2,2), legend=false) #4 графика в матрице 2х2 без легенды

#множестыенная отправка
methods(+) #показывает все методы, в которых можно использовать +
@which 3 + 3 #покажет типы данных и ссылку на место, где этот метод объявлен
#добавить новый метод
"a" + "b" #ошибочная команда, тк строки нельзя складывать
import Base: +
+(x::String, y:: String) = string(x, y) #метод для сложения строк
#теперь "а" + "b" будет ровняться ab
