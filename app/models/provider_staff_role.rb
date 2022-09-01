# frozen_string_literal: true

# staff role information for provider users
class ProviderStaffRole
  embedded_in :user, class_name: 'User'

  field :provider_gateway_identifier, type: String
  field :provider_id, type: BSON::ObjectId
  field :is_active, type: Boolean

  def active?
    is_active
  end
end