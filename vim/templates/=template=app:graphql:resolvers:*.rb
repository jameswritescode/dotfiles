# frozen_string_literal: true

class Resolvers::%CAMELCLASS% < Resolvers::Base
  type Types::%CAMELCLASS%Type

  argument :id, ID, required: true

  def resolve(id:)
    %HERE%
  end
end
