# frozen_string_literal: true

InputTypes::NameType = GraphQL::InputObjectType.define do
  name 'NameInput'

  input_field :id, types.Int
end
