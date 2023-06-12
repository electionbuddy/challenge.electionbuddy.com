# frozen_string_literal: true

class Election < ApplicationRecord
  include Auditable

  has_many :questions
  has_many :voters
  belongs_to :user

  serialize :settings, Hash

  def save(current_user)
    self.whodunnit = current_user
    super()
  end

  def update(params, current_user)
    self.assign_attributes(params)
    self.save(current_user)
  end

  def destroy(current_user)
    self.whodunnit = current_user
    super()
  end
  
  def visibility
    settings[:visibility]
  end

  def visibility=(value)
    settings[:visibility] = value
  end
end
