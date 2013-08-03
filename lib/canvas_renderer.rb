class CanvasRenderer
  def render(canvas_size, points)
    canvas_size.times.map do |y|
      canvas_size.times.map do |x|
        points.any? { |point| point.x == x && point.y == y } ? "X" : "."
      end.join(" ")
    end.reverse.join("\n")
  end
end
