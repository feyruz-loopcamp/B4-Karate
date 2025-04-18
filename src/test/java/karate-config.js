function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    docuport_base_url: 'https://beta.docuport.app',
	hello_world_api_url: 'https://sandbox.api.service.nhs.uk/hello-world/hello/world',
    single_minion_path_param: '/minions/2',
    minion_base_url: 'http://3.86.36.108:8000/api',
}
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}