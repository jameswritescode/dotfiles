# frozen_string_literal: true

class Resolvers::%CAMELCLASS%Type < BaseResolver
  type Types::%CAMELCLASS%Type

  argument :id, types.ID

  def resolve
    %HERE%
  end
end
