def input_includes_naughty?
  naughty_list.include? @params['name'].gsub(/[^0-9A-Za-z]/,'')
end

def input_includes_magnet?
  magnet_list.include? @params['name']
end

def naughty_list
  @_naughty_list ||= begin
    file = File.read('naughty.json')
    all = JSON.parse(file).to_a
    all.map { |string| string.gsub(/[^0-9A-Za-z]/, '') }
  end
end

def magnet_list
  @_magnet_list ||= begin
    file = File.read('magnet.json')
    all = JSON.parse(file).to_a
    s = all.map { |string| string }
  end
end

def any_empty?(inputs)
  inputs.any? { |input| input == '' }
end
