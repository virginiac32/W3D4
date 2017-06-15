class Question < ApplicationRecord
  validates :question, :poll_id, presence: true

  has_many :answer_choices,
    class_name: "AnswerChoice",
    primary_key: :id,
    foreign_key: :question_id

  belongs_to :poll,
    class_name: "Poll",
    primary_key: :id,
    foreign_key: :poll_id

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results_n_plus_one
    poll_count = Hash.new
    self.answer_choices.each do |answer_choice|
      poll_count[answer_choice.answer] = answer_choice.responses.count
    end
    poll_count
  end

  def results
    responses = self.answer_choices.includes(:responses)
    poll_count = Hash.new
    responses.each do |answer_choice|
      poll_count[answer_choice.answer] = answer_choice.responses.length
    end
    poll_count
  end

  # currently attempting
  def results_2
    # response = AnswerChoice
    #   .select("answer_choices.answer","COUNT(*)")
    #   .joins(:answer_choices)
    #   .where("answer_choices.question_id = self.id")
    #   .group("answer_choices.id")
    # poll_count = Hash.new
    # response.each do |answer_choice, count|
    #   poll_count[answer_choice] = count
    # end
    # poll_count
  end
end
