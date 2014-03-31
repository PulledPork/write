# FOR MORE INFO SEE: http://courseware.codeschool.com/coffeescript_slides.pdf
# [VAR/FUNCTION NAME] = (function parameters) ->


# In JS: 
# $(document).ready(function(){
#	$('body').prepend("THIS WAS INSERTED VIA JavaScript - application.js")
# });

$ ->
	# IF element with ID JSmessage exists, RUN coffee function, add classes to field
	if $('#JSmessage').length isnt 0 then $('#JSmessage').addClass("alert alert-danger").html(coffee)
	# $('body').prepend(coffee)	    # this calls the coffee function below

 
# In JS:
# var coffee = function() {
#   return confirm("Ready for some Coffee?");
# }
#
coffee = ->
	answer = confirm "ready for some coffee?"
	"Your answer is #{answer}" # same as return "X..."

# the "->"  TRANSLATES TO "function(){"
# coffee is the variable containing the result 