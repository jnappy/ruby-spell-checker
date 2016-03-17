# run in terminal export PATH=/opt/local/bin:/opt/local/sbin:$PATH

require 'spellchecker'
require 'pry'

ERROR_MESSAGE = "Error: The word "" is invalid. Empty string."

def programming_variable?(word)
	camel_case = false
	word.split("").each_with_index do |letter, index| 
		capital_letter = (letter == letter.upcase)
		camel_case = true if capital_letter and index > 0
		break if camel_case 
	end
	return camel_case
end


@acceptable_words = [

	"Mathe", 
	"mins", 
	"xml", 
	"interpolator", 
	"GitHub", 
	"img",
	"src",
	"comparator",
	"programmatically",
	"gif", 
	"readme", 
	"RDs", 
	"UI", 
	"Deliverables", 
	"deliverables",
	"screenshot",
	"API", 
	"pseudocode", 
	"wireframes", 
	"repo",
	"Screenshots",
	"Screenshot", 
	"Timeline", 
	"lifecycle",
	"screenshots",
	"backticks",
	"Trello",
	"backticks",
	"api",
	"namespace",
	"Gmail", 
	"Instantiation",
	"instantiation",
	"getter",
	"refactor",
	"int",
	"subclasses",
	"Subclasses",
	"prepend",
	"getter",
	"setter",
	"superclass",
	"runtime",
	"workflow",
	"breakpoint",
	"Codealong",
	"codealong",
	"codebase",
	"Codebase",
	"outlier",
	"searchable",
	"Gson",
	"gson",
	"Spotify",
	"datatypes",
	"URL",
	"URI",
	"uncomment",
	"pseudocode",
	"polymorphism",
	"Polymorphism",
	"whiteboarding",
	"Whiteboarding",
	"Immersive",
	"immersive",
	"middleware"

]

@acceptable_characters = [
	"/", 
	".", 
	"<",
	">",
	")",
	"(",
	"`",
	"-",
	"|", 
	"_",
	"^",
	"]",
	"[",
	"#",
	"*",
	"="
]

log_file  = File.new("wdi-log.txt", "w")

Dir.glob('../../ga-wdi/wdi/**/*.md') do |file|
	File.open(file).each_with_index do |line, index|
		line.split(" ").each do |word|
			puts "Spell checking..."
			results = Spellchecker.check(word) unless @acceptable_words.include?(word) or programming_variable?(word) or @acceptable_characters.any? { |character| word.include?(character) } or file.include?("template")
			if results  
				log_file.puts "#{word}: #{file} | #{index} | #{line} " unless results.first[:correct] or results == ERROR_MESSAGE

			end
		end
	end
end

log_file.close

puts "All done!"







