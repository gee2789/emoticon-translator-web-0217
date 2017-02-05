require 'yaml'

def load_library(file_path)
  library = {"get_meaning" => {}, "get_emoticon" => {} }
  #sets library = to new hashes / "get_meaning" and "get_emoticon"
  YAML.load_file(file_path).each do |meaning, array|
    #looks at the YAML file.  Has meaning and then assoicated array
    #meaning: Angel, array:["0:)", "☜(⌒▽⌒)☞]
    english, japanese = array
    #not sure here.  Creates a new variable "english, japanese" and sets it equal to array
    library["get_emoticon"][english] = japanese
    library["get_meaning"][japanese] = meaning
    #no idea what's going on here.
  end
  library
end


def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
    #loads the library
  result = library["get_emoticon"][emoticon]
    #sets result equal to a call into the hashes
  if result
    result
    #if result is truthy, then return result
  else
    "Sorry, that emoticon was not found"
    #if results does not exist, then return "not found" message.
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  result = library["get_meaning"][emoticon]
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end
