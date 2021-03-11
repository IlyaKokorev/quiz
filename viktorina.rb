require_relative 'lib/question'
files =  Dir["data/*.txt"] # путь к папке с вопросами

puts "Мини - викторина. Ответьте на вопросы."

user_rate = 0
user_points = 0
question_arr = []

# При чтении содержимого файла передавайте все прочитанные значения в конструктор:
# Складывайте экземпляра класса Question в массив.
files.each do |question_file|
  question_lines = File.readlines(question_file, chomp: true, encoding: 'UTF-8')
  question_arr << Question.new(question_lines[0],
                               question_lines[1],
                               question_lines[2])
end

# А потом получайте нужную информацию из экземпляра вопросам соотв. методом: puts question.text
quiz_game = question_arr.shuffle

quiz_game.each do |question|
  puts question.text
  puts "#{question.points} балла."

  user_answer = gets.chomp

  if user_answer.downcase == question.answer
    user_rate += 1
    user_points += question.points
    puts 'Верно!'
  else
    puts "Неверно! Правильный ответ: #{question.answer}!"
  end
end

puts "Вы угадали #{user_rate} вопросов из #{question_arr.size}! Вы набрали #{user_points} баллов!" # вывели счет
puts 'Вы прирожденный программист!' if user_rate > question_arr.size * 0.5 # шутка минутка
