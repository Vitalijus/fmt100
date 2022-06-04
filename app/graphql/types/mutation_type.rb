module Types
  class MutationType < Types::BaseObject

    # Odometers
    field :create_update_odometer, mutation: Mutations::Odometers::CreateUpdateOdometer
  end
end
