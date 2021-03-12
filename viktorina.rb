require_relative 'lib/question'

files = Dir.glob(__dir__ + "/data/*.txt")

user_rate = 0
user_points = 0

puts "Мини - викторина. Ответьте на вопросы."

question_arr = files.map do |question_file|
  question_lines = File.readlines(question_file, chomp: true, encoding: 'UTF-8')
  Question.new(question_lines[0],
               question_lines[1],
               question_lines[2])
end

quiz_game = question_arr.shuffle

quiz_game.each do |question|
  puts question.to_s

  user_answer = gets.chomp

  if user_answer.downcase == question.answer
    user_rate += 1
    user_points += question.points
    puts 'Верно!'
  else
    puts "Неверно! Правильный ответ: #{question.answer}!"
  end
end

puts "Вы угадали #{user_rate} из #{question_arr.size} вопросов! Вы набрали #{user_points} баллов!" # вывели счет
puts 'Вы прирожденный программист!' if user_rate > question_arr.size * 0.5 # шутка минутка
