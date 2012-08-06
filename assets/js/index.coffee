$ ->
	$('#input>input').keypress (e)->
		if e.which == 13
			el = $(@)
			$('#log').append $('<div class="entry">').html el.val()
			el.val('')
