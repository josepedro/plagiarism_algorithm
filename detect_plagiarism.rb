require "docx"

document = Docx::Document.open('text.docx')

document_string = document.to_s

puts document_string

#doc.paragraphs.each do |p|
#	  puts p
#end

