class CanvasRenderer
  def render(canvas_size, points)
    lines = []
    (canvas_size - 1).downto(0) do |y|
      line = []
      canvas_size.times do |x|
        char = points.any? { |point| point.x == x && point.y == y } ? "X" : "."
        line << char
      end
      lines << line.join(" ")
    end
    lines.join("\n")
  end
end
