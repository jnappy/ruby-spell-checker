require 'spellchecker'
require 'pry'

system "export PATH=/opt/local/bin:/opt/local/sbin:$PATH"

@ERROR_MESSAGE = "Error: The word "" is invalid. Empty string."

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
	"getter",
	"Getter",
	"Instantiation",
	"instantiation",
	"getters",
	"refactor",
	"int",
	"subclasses",
	"Subclasses",
	"prepend",
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
	"toolbar",
	"Toolbar",
	"login",
	"remediate", 
	"styleguide",
	"Immersive",
	"toolbars",
	"Toolbars", 
	"boolean",
	"Boolean",
	"subclassing",
	"Subclassing", 
	"Lifecycle", 
	"Workflow",
	"workflow",
	"rebase",
	"Rebase",
	"rebasing",
	"Rebasing",
	"Filesystem",
	"filesystem",
	"mkdir",
	"cp",
	"cd",
	"chmod",
	"bashrc",
	"sublime",
	"subl",
	"hardcoded",
	"sublist",
	"json",
	"params",
	"inbox", 
	"analytics",
	"Analytics",
	"Immersive",
	"immersive",
	"middleware",
	"refactor",
	"templating",
	"foundational",
	"prepended",
	"codebases",
	"Repo"


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

log_file  = File.new("adi-log.txt", "w")

Dir.glob('../../ga-adi/adi-course-materials/**/*.md') do |file|
	File.open(file).each_with_index do |line, index|
		line.split(" ").each do |word|
			puts "Spell checking..."
			results = Spellchecker.check(word) unless @acceptable_words.include?(word) or programming_variable?(word) or @acceptable_characters.any? { |character| word.include?(character) } or file.include?("template")
			if results  
				log_file.puts "#{word}: #{file} | #{index} | #{line} " unless results.first[:correct] or results == @ERROR_MESSAGE

			end
		end
	end
end

log_file.close

puts "All done!"







