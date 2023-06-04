# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  after_save :log

  def log
    question.election.election_logs.create(activity: "Answered: #{name}")
  end
end
