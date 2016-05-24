angular.module 'xmlFiestaUiApp'
  .constant 'TRANSLATIONS_ES', {
    HEADER:
      HOME: '¿Cómo Funciona?'
      VERIFY: 'Verificar XML'
      FAQ: '¿Cómo Funciona?'
      CONTACT: 'Contacto'
      CONFIG: 'Configuración'

    VERIFY:
      TITLE: '¿Cómo Funciona?'
      ROOT: 'Carga los certificados raíz correspondientes. Actualmente este validador sólo funciona con certificados emitidos por el SAT de México.'
      XML: 'Carga el archivo XML que quieras verificar. El archivo XML contiene toda la información necesaria para realizar esta verificación.'
      VALIDATION: 'El sistema realizará las validaciones necesarias. Es necesario que todas sean exitosas para garantizar la legitimidad del documento.'
      GET_STARTED: 'Comienza Ahora'
      DRAG: 'Arrastra el XML que quieras verificar'
      SELECT: 'o haz click aquí para seleccionar uno'
      VALIDATIONS: 'Validaciones'
      REMINDER: 'Asegúrate de revisar que ninguno de los campos muestre un error (tache rojo). En ausencia de errores puedes estar seguro de que el documento fue firmado correctamente.'
      DOCUMENT_NAME: 'Documento'
      ORIG_HASH: 'Hash Original '
      WHY: '¿Por qué?'
      WRONG_HASH: 'El hash calculado no coincide con el hash del documento original. El documento original fue cambiado o se está usando el hash de otro documento.'
      SIGNER: 'Firmante'
      ID: 'RFC'
      SIG_DATE: 'Fecha de Firma'
      CERT_NUMBER: 'Núm de Certificado '
      REVIEW: 'A continuación puedes revisar el documento que fue firmado.'
      NEW_DOC: 'Validar otro documento'
      SIGNATURE: 'Firma '
      WRONG_CERT: 'El certificado no fue firmado con ninguno de los certificados raíz que cargaste en la página de configuración. Asegúrate de haber cargado todos los certificados raíz de la autoridad que emitió el certificado usado para firmar. Si este error persiste significa que el certificado no fue emitido por la autoridad certificadora dueña de los certificados raíz.'
      WRONG_SIG: 'La Firma no es válida, pudo haber sido modificada o no se usó la llave privada correspondiente al certificado mencionado anteriormente.'
      LOADING: 'Validando documento...'
      CONSERVANCY_RECORD: 'Constancia de conservación'
      RECORD:
        ISSUER: 'Emisor'
        TIMESTAMP: 'Fecha de constancia'

    FAQ:
      ABOUT: 'Acerca de'
      INTRO: 'XML Fiesta es una herramienta para validar Firmas Electrónicas Avanzadas.'
      NOTICE: '*Esta versión soporta únicamente documentos firmados usando la FIEL (eFirma) del SAT a través de la plataforma de '
      HOW: '¿Cómo Funciona?'
      FIRST: '1. Cargar los certificados raíz de la autoridad certificadora (ej. SAT) que emitió los certificados con los que se firmó el documento.'
      SECOND: '2. Seleccionar o arrastrar el documento firmado (en formato XML).'
      THIRD: '3. La aplicación realizará tres validaciones y si se cumplen todas podrás estar 100% seguro de que tienes un documento firmado correctamente por la persona o personas indicadas otorgándole todo el valor legal que la ley le confiere a los documentos firmados mediante Firmas Electrónicas Avanzadas.'
      WHAT: '¿Qué valida esta aplicación?'
      VALIDATION_1: '1. Que la huella digital o hash del documento original (PDF) sea la correcta.'
      VALIDATION_2: '2. Que los certificados que se usaron para firmar no sean apócrifos.'
      VALIDATION_3: '3. Que la Firma Electrónica corresponda al documento que se firmó.'
      QUESTIONS: '¿Dudas o preguntas?'
      EMAIL: 'Envíanos un correo'

    FOOTER:
      MADE: 'Hecho '
      MADE2: 'por el equipo de '
      SOURCE_CODE: 'Ver código fuente'

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
