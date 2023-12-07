data "aws_kms_secrets" "secrets" {
  secret {
    name    = "asa_password"
    payload = "AQICAHjzsLpC8PXnTX9+1EPgyRpqK/yaTtFlJQfZVblJgxJbkgEsCNh75lHMZpzl62gM8LY/AAAAajBoBgkqhkiG9w0BBwagWzBZAgEAMFQGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMDlYciyBILb3/G1uDAgEQgCd3woLaxKJsiK+Fm4uD7hPZxbAnQFK3fE7d1IRni8QZto95kHowHGo="
  }

  secret {
    name    = "sdc_password"
    payload = "AQICAHjzsLpC8PXnTX9+1EPgyRpqK/yaTtFlJQfZVblJgxJbkgGzcGSoo4t/8tk32jg0PbGtAAAAaTBnBgkqhkiG9w0BBwagWjBYAgEAMFMGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMdrHKJPTBWN0lvx33AgEQgCaAjZ5BiIU8LypuhpSvFqKM8sXk4EN9XQErGP7b7u0rUdOljSKWqQ=="
  }

  secret {
    name    = "ftd_password"
    payload = "AQICAHjzsLpC8PXnTX9+1EPgyRpqK/yaTtFlJQfZVblJgxJbkgFwFQ6dpKWDI40ce7yg15rpAAAAdDByBgkqhkiG9w0BBwagZTBjAgEAMF4GCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMPo0MtfdlvGYQr8SdAgEQgDG2K0+eJ2xh4FZ6REFNo0FFxmFfhdCIgHtX+Gn0gopZ+spaovIKd5gCkjK2V7/69fL6"
  }

  secret {
    name    = "asa_in_dc_password"
    payload = "AQICAHjzsLpC8PXnTX9+1EPgyRpqK/yaTtFlJQfZVblJgxJbkgGbpyhuMIuBrK7hMohyZOllAAAAcDBuBgkqhkiG9w0BBwagYTBfAgEAMFoGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMvOtmi7Q6p0yN2DYwAgEQgC2AFOBAHidtwcDUSW7dIVxHF0RW77SirVkt+AUV7wQDa204Plg0SXUYqaQR7Y0="
  }
}
locals {
  asa_username       = "admin"
  asa_password       = trimspace(data.aws_kms_secrets.secrets.plaintext["asa_password"])
  ftd_password       = trimspace(data.aws_kms_secrets.secrets.plaintext["ftd_password"])
  sdc_password       = trimspace(data.aws_kms_secrets.secrets.plaintext["sdc_password"])
  asa_in_dc_username = "lockhart"
  asa_in_dc_password = trimspace(data.aws_kms_secrets.secrets.plaintext["asa_in_dc_password"])
}
