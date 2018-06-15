# frozen_string_literal: true

class Resolvers::%CAMELCLASS% < BaseResolver
  type Types::%CAMELCLASS%Type

  argument :id, types.ID

  def resolve
    %HERE%
  end
end
