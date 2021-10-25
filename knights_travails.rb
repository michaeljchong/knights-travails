class Knight
  def initialize(start)
    @visited = [start]
    @path = Array.new(8) { [start] }
  end

  def valid_position?(pos)
    pos.each { |idx| return false if idx.negative? || idx > 7 }
    true
  end
end
