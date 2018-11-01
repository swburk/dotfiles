if exists("loaded_matchit")
	let b:match_ignorecase = 1
	let b:match_words = '<:>,' .
	\ '<\@<=cfif\>[^>]*\%(>\|$\):<\@<=cfelseif\>[^>]*\%(>\|$\):<\@<=cfelse\>:<\@<=/cfif>,' .
	\ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif
