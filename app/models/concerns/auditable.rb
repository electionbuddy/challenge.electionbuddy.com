module Auditable
  extend ActiveSupport::Concern

  included do
    has_many :versions, as: :item

    after_create :audit_create
    after_update :audit_update
    after_destroy :audit_destroy
  end

  private

  def audit_create
    create_version('create')
  end

  def audit_update
    create_version('update')
  end

  def audit_destroy
    create_version('destroy')
  end

  def create_version(event)
    Version.create(
      item_type: self.class.name,
      item_id: id,
      event: event,
      whodunnit: 1, #TODO: current_user.id,
      object: previous_changes
    )
  end
end