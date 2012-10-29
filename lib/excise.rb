# encoding: utf-8
require "excise/version"
require "excise/base"
require "forwardable"

module Excise
  class << self
    extend Forwardable

    def_delegator 'Excise::Base', :new
  end

  def self.parse(pattern, string)
    new(pattern).parse(string)
  end
end

def Excise(pattern, string)
  Excise.parse(pattern, string)
end
