Apipie.configure do |config|
  config.app_name                = "Campanias"
  config.api_base_url            = ""
  config.doc_base_url            = "/apipie"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/*.rb"
  config.app_info = "<p>Sistema de control de actividades para campañas electorales.</p>
                    <p><strong>Hash</strong>: se refiere a un objeto de forma json, donde los atributos mostrados<br/>
                    de esta forma: <em>Hash['Attributo']</em>  se refiere al la propiedad del objeto: user:{'attributo':'valor'} "
end
