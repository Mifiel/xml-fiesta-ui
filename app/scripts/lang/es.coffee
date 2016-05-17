angular.module 'xmlFiestaUiApp'
  .constant 'TRANSLATIONS_ES', {
    HEADER:
      HOME: '¿Cómo Funciona?'
      VERIFY: 'Verificar XML'
      CONTACT: 'Contacto'
      CONFIGURATION: 'Configuración'
    VERIFY:
    	TITTLE: '¿Cómo Funciona?'
    	ROOT: 'Carga los certificados raíz correspondientes. Actualmente este validador sólo funciona con certificados emitidos por el SAT de México.'
    	XML: 'Carga el archivo XML que queiras verificar. El archivo XML contiene toda la información necesaria para realizar esta verificación.'
    	VALIDATION: 'El sistema realizará las validaciones necesarias. Es necesario que todas sean exitosas para garantizar la legitimidad del documento.'
    	GET_STARTED: 'Comienza Ahora'
    	DRAG: 'Arrastra el XML que quieras verificar'
    	SELECT: 'o haz click aquí para seleccionar uno'
    FOOTER:
    	MADE: 'Hecho con '
    	MADE2: 'por el equipo de '
    CONFIG:
    	CERTIFICATES_LOADED: '¿Haz cargado todos los Certificados Raíz?'
    	VER_BUTTON: 'Proceder a verificar'
    	SELECT: 'Carga los Certificados Raíz'
    	ALL: 'Asegúrate de seleccionar todos los certificados raíz correspondientes a la autoridad certificadora. Puedes seleccionar varios certificados a la vez.'
    	AFTER: 'Una vez que hayas cargado los certificados raíz verás un botón que te permitirá seguir con el proceso de validación de un archivo XML.'
    	LOADED: 'Certificados Raíz que has cargado'
    	DELETE: 'Borrar todos los certificados '
    	UNDONE: '(Está acción no puede ser revertida, tendrás que cargarlos de nuevo)'

  }
