Module Assembly
class Parser
  def parse(input)
    program = []
    input.lines.each do |line|
      tokens = line.split(' ')
      instruction = tokens[0].to_sym
      data = tokens.drop.each { |x| x.to_i }
    end
  end
end
