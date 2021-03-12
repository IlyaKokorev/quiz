class Question
  attr_reader :text, :answer, :points

  def initialize(text, answer, points)
    @text = text
    @answer = answer
    @points = points.to_i
  end

  def to_s
    <<~QUESTION
    #{@text}
    #{@points} баллов
    QUESTION
  end
end
