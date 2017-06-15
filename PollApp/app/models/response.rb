class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :poll_creator_cannot_answer
  validate :not_duplicate_response

  belongs_to :answer_choice,
    class_name: "AnswerChoice",
    primary_key: :id,
    foreign_key: :answer_choice_id

  belongs_to :respondent,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id

  has_one :question,
    through: :answer_choice,
    source: :question

  private
  def not_duplicate_response
    if respondent_already_answered?
      errors[:base] << "User cannot answer the question twice"
    end
  end

  def respondent_already_answered?
    user_ids = sibling_responses
    return true if user_ids.exists?(user_id: user_id)
    return false
  end

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  def poll_creator_cannot_answer
    if question.poll.author.id == respondent.id
      errors[:base] << "User cannot respond to their own poll"
    end
  end
end
