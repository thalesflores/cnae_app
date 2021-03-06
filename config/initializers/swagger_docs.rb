Swagger::Docs::Config.register_apis({
  "1.0" => {
    # the extension used for the API
    :api_extension_type => :json,
    # the output location where your .json files are written to
    :api_file_path => "public/api/v1/",
    # the URL base path to your API
    :base_path => "localhost:300",
    # if you want to delete all .json files at each generation
    :clean_directory => false,
    # Ability to setup base controller for each api version. Api::V1::SomeController for example.
    #:parent_controller => Api::V1::SomeController,
    # add custom attributes to api-docs
    :attributes => {
      :info => {
        "title" => "Cnae API",
        "description" => "API to save and show cnae transactions"
      }
    }
  }
})
