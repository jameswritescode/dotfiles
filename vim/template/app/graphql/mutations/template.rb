# frozen_string_literal: true

module Mutations
  class <+CURSOR+> < Base
    field :hello, String, null: false

    argument :hello, String, required: true

    def resolve(hello:)
      { hello: hello }
    end
  end
end
