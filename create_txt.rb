require "docx"

files_number = 16
puts "asd"
Dir['works/*.docx'].each do |file|
	document = Docx::Document.open(file)
	document_string = document.to_s
	file_txt = File.new("txts/"+files_number.to_s+".txt", "w")
	file_txt.puts document_string
	files_number = files_number + 1
end



