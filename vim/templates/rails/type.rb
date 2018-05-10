# frozen_string_literal: true

Types::NameType = GraphQL::ObjectType.define do
  name 'Name'

  field :id, types.ID
end
