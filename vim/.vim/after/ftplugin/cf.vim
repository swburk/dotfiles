if exists("loaded_matchit")
	let b:match_ignorecase = 1
	let b:match_words = '<:>,' .
	\ '<\@<=cfif\>[^>]*\%(>\|$\):<\@<=cfelseif\>[^>]*\%(>\|$\):<\@<=cfelse\>:<\@<=/cfif>,' .
	\ '<\@<=cfquery\>[^>]*\%(>\|$\):<\@<=/cfquery>,' .
	\ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif
