function plagiarism_coef = get_plagiarism(text1, text2)
	text1_words = change_scale(text1);
	text2_words = change_scale(text2);
	text1_array = double(char(text1_words));
	text2_array = double(char(text2_words));

	length_min = min([length(text1_array) length(text2_array)]);

	plagiarism_coef = corrcoef(text1_array(1: length_min), text2_array(1: length_min));