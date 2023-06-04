# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :election
  has_many :answers
  after_save :log

  def log
    self.election.election_logs.create(activity: "Question: #{name}")
  end
end
