# encoding: utf-8
require "excise/version"
require "excise/base"

module Excise
  def self.parse(string, pattern)
    Base.new(string, pattern).parse
  end
end

def Excise(string, pattern)
  Excise.parse(string, pattern)
end
