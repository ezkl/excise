# encoding: utf-8
require "excise/version"
require "excise/base"

module Excise
  def self.parse(pattern, string)
    Base.new(pattern).parse(string)
  end
end

def Excise(pattern, string)
  Excise.parse(pattern, string)
end
