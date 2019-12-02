angular.module 'xmlFiestaUiApp'
  .constant 'TRANSLATIONS_EN', {
    HEADER:
      HOME: 'Home'
      VERIFY: 'Verify XML'
      CONTACT: 'Contact'
      CONFIGURATION: 'Configuration'

    VERIFY:
      ENCRYPT:
        ALERT: "is an encrypted document. Click here to decrypt and download the signed document."
        INFORMATION_NOT_AVAILABLE: "This information is not available because it belongs to an encrypted document."
        NOTE: "We can't show the contents of this document because it is encrypted."
        DECRYPT_DOCUMENT: "Decrypt document"
  }
