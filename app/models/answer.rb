# frozen_string_literal: true

class Answer < ApplicationRecord
  include Auditable
  
  belongs_to :question

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
end
