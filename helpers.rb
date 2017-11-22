def input_includes_naughty?
  naughty_list.any? { |naughty| naughty.match(@params['email'].strip) }
end

def naughty_list
  @_naughty_list ||= begin
    file = File.read('naughty.json')
    JSON.parse(file)
  end
end

def any_empty?(inputs)
  inputs.any? { |input| input == '' }
end
