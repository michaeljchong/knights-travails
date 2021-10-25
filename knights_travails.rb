class Knight
  def initialize(start)
    @visited = [start]
    @path = Array.new(8) { [start] }
  end
end
