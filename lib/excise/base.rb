# encoding: utf-8

module Excise
  class Base
    TOKEN_EXPRESSION = /{([^{}\t\r\n]+)}/.freeze
    SPECIAL_CHARACTERS_EXPRESSION = /[\\\^\$\*\+\.\?\(\)\[\]]/.freeze

    def initialize(pattern)
      @pattern = pattern
    end

    def parse(string)
      @matches = pattern_expression.match(string)

      output = {}

      tokens.each_with_index do |key, index|
        output[key.to_sym] = @matches[index+1]
      end

      output
    end

    def tokens
      @tokens ||= @pattern.scan(token_expression).flatten
    end

    def pattern_expression
      @pattern_expression ||= Regexp.new(@pattern.gsub(special_characters_expression, '\\\\\0').gsub(token_expression, "(\.+)"))
    end

    def token_expression
      TOKEN_EXPRESSION
    end

    def special_characters_expression
      SPECIAL_CHARACTERS_EXPRESSION
    end
  end
end
