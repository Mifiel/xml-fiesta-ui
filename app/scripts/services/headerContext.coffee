angular.module 'xmlFiestaUiApp'
.service 'HeaderContext', -> 
	this.context =
		validatedDocReady: false
	return