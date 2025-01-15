locals {
  lambda_package_path = "C:/Users/ramakrishna/Downloads/existing_package.zip"  # Provide the local path to your zip file
}

resource "null_resource" "upload_package" {
  triggers = {
    downloaded = local.lambda_package_path
  }

  provisioner "local-exec" {
    command = "echo 'Using local zip file: ${local.lambda_package_path}'"
  }
}

data "null_data_source" "lamda_package_data" {
  inputs = {
    #id       = null_resource.upload_lambda_package.id
    filename = local.lambda_package_path
  }
}

module "lambda_function_existing_package_from_local_file" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "my_lambda_function"
  description   = "My awesome lambda function"
  handler       = "index.lambda_handler"
  runtime       = "python3.12"
  create_package         = false
  local_existing_package = data.null_data_source.lamda_package_data.outputs["filename"]
}



# module "name" {
#   source                 = "terraform-aws-modules/lambda/aws"
#   function_name          = "my-function"
#   handler                = "lambda_function.lambda_handler"
#   runtime                = "python3.12"
#   create_package         = false
#   local_existing_package = "lambda_function.zip"
#   #local_existing_package = "../Day-6-Lambda-Creation-withoutS3/lambda_function.zip"
# }
