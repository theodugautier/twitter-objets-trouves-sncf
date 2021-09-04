# frozen_string_literal: true

require 'httparty'

module Api
  class Base
    def call
      raise NotImplementedError
    end
  end
end
