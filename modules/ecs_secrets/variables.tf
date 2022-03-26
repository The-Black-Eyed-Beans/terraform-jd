variable secrets {
   type = list(object({
      name = string,
      secret_string = string
   }))
}

variable proxy-secrets {
   type = object({
      ACCOUNT_SERVICE = string,
      BANK_SERVICE = string,
      TRANSACTION_SERVICE = string,
      UNDERWRITER_SERVICE = string,
      USER_SERVICE = string
   })
}