# frozen_string_literal: true

class Voter < ApplicationRecord
  belongs_to :election
  after_save :log

  def log
    self.election.election_logs.create(activity: "Voter: <#{name}>(#{email})")
  end
end