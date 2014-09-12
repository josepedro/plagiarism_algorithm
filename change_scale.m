function string_array = string_scale(text)

	%text = sscanf(text, '%s');
	
	text = regexp(text, '\s+','split');
	possibles_strings{1} = char(text{1});
	possibles_iterator = 2;
	for iterator = 1:length(text)
		if(sum(ismember(possibles_strings, text{iterator})) == 0)
			possibles_strings{possibles_iterator} = char(text{iterator}); 
			possibles_iterator = possibles_iterator + 1;
		end
	end
	possibles_strings;

	frequencies_strings(1:length(possibles_strings)) = 0;
	for iterator = 1:length(possibles_strings)
		frequencies_strings(iterator) = sum(ismember(text, possibles_strings{iterator}));
	end
	frequencies_strings;

	%Form the alphabet ordenated with frequencies of letters
	n = length(frequencies_strings);
	for k = 1:n-1
  	for j = 1:n-k
   			if(frequencies_strings(j)> frequencies_strings(j+1))
			    temp = frequencies_strings(j);
			    temp_string = char(possibles_strings{j});

			    frequencies_strings(j) = frequencies_strings(j+1);
			    possibles_strings{j} = char(possibles_strings{j+1});

			    frequencies_strings(j+1) = temp;
			    possibles_strings{j+1} = temp_string;
   			end % if
  		end % for
	end % for
	frequencies_strings;
	possibles_strings;

	%frequencies_strings = sort(frequencies_strings, 'descend');
	%possibles_strings = fliplr(possibles_strings);

	%Construct the values of array text with slot the letters ordenated
	string_array(1:length(text)) = 0;
	for iterator = 1:length(text)
			[boolean, index] = ismember(text{iterator}, possibles_strings);
			if(boolean == 1)
				string_array(iterator) = index;
			end
	end