def input_includes_naughty?
  p = @params['name']
  naughty_list.include? p.gsub(/[^0-9A-Za-z]/,'')
end

def naughty_list
  @_naughty_list ||= begin
    file = File.read('naughty.json')
    all = JSON.parse(file).to_a
    all.map { |string| string.gsub(/[^0-9A-Za-z]/, '') }
  end
end

def any_empty?(inputs)
  inputs.any? { |input| input == '' }
end
