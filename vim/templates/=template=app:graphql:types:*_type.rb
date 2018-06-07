# frozen_string_literal: true

Types::%CAMELCLASS% = GraphQL::ObjectType.define do
  name '%CAMELCLASS%'

  field :id, types.ID%HERE%
end
