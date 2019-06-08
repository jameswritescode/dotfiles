# frozen_string_literal: true

module Types
  class <+CURSOR+>Type < BaseObject
    field :hello, String, null: false
    def hello
      'world'
    end
  end
end
