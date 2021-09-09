module Findable
  def all
    @all ||= []
  end
  attr_writer :all

  def find_by(key, value)
    all.detect { |e| e.send(key) == value }
  end
end
