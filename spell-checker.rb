require 'spellchecker'
require 'pry'

def programming_variable?(word)
	counter, camel_case = 0, false
	word.split("").map do |letter| 
		capital_letter = (letter == letter.upcase)
		counter += 1 if capital_letter
		camel_case = true if capital_letter and word.index(letter) > 0
	end
	return (counter > 1 or camel_case ? true : false)
end


@acceptable_words = [
	"Mahrt", 
	"Kaleda",
	"Yuliya",
	"Kerner", 
	"mins", 
	"xml", 
	"interpolator", 
	"RecyclerView",
	"RecyclerViews",
	"GitHub", 
	"Ayinde",
	"Recycler", 
	"img",
	"src",
	"comparator",
	"programmatically",
	"gif",
	"ViewGroup", 
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
	"Missoula",
	"Bartz",
	"polymorphism",
	"Polymorphism",
	"whiteboarding",
	"Whiteboarding",

]

@acceptable_characters = [
	"/", 
	".", 
	"<",
	">",
	")",
	"(" 
]

Dir.glob('../../ga-adi/adi-curriculum/**/*.md') do |file|
	File.open(file).each_with_index do |line, index|
		line.split(" ").each do |word|
			results = Spellchecker.check(word) unless @acceptable_words.include?(word) or programming_variable?(word) or @acceptable_characters.any? { |character| word.include?(character) } or file.include?("template")
			if results  
				puts "#{file} | #{line} | #{results}" unless results.first[:correct] 
			end
		end
	end
end

puts "All done!"







