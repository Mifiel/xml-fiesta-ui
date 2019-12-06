angular.module 'xmlFiestaUiApp'
  .constant 'TRANSLATIONS_EN', {
    HEADER:
      HOME: 'Home'
      VERIFY: 'Verify XML'
      CONTACT: 'Contact'
      CONFIGURATION: 'Configuration'
    VERIFY:
      ENCRYPT:
        ALERT: "Since you loaded an <b>encrypted XML</b> of the signed document, we cannot validate the Original Hash or the Signature. To validate all fields, click on “Validate another document” and load the <b>decrypted XML</b> of the signed document."
        HASH_NOT_AVAILABLE: "The original hash cannot be validated because the XML you loaded is encrypted."
        SIGNATURE_NOT_AVAILABLE: "The signature cannot be validated because the XML you loaded is encrypted."
        NOTE: "We can't show the contents of the signed document because the XML is encrypted. To visualize its contents, click on “Validate another document” and load the <b>decrypted XML</b> of the signed document."
  }
