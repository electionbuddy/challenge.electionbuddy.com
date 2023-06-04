# frozen_string_literal: true

class Election < ApplicationRecord
  has_many :questions
  has_many :election_logs
  belongs_to :user

  serialize :settings, Hash

  after_save :log

  def visibility
    settings[:visibility]
  end

  def visibility=(value)
    settings[:visibility] = value
  end


  def log
    election_logs.create(activity: "Election: [#{visibility}]#{name} From #{start_at.to_formatted_s(:short)} To #{end_at.to_formatted_s(:short)}")
  end
end
