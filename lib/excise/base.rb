# encoding: utf-8

module Excise
  class Base
    def initialize(string, pattern)
      @string  = string
      @pattern = pattern
      @matches = pattern_expression.match(@string)
      @output = {}
    end

    def parse
      tokens.each_with_index do |key, index|
        @output[key.to_sym] = @matches[index+1]
      end
      @output
    end

    def tokens
      @pattern.scan(token_expression).flatten
    end

    def pattern_expression
      Regexp.new(@pattern.gsub(special_characters_expression, '\\\\\0').gsub(token_expression, "(\.+)"))
    end

    def token_expression
      /{([^{}\t\r\n]+)}/
    end

    def special_characters_expression
      /[\\\^\$\*\+\.\?\(\)\[\]]/
    end
  end
end
