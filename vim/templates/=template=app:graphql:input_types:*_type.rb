# frozen_string_literal: true

InputTypes::%CAMELCLASS% = GraphQL::InputObjectType.define do
  name '%HERE%'

  input_field :id, types.Int
end
