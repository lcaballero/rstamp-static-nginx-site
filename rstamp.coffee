module.exports = {
  name      : 'static-nginx-site'
  summary   : '''
This generator creates a directory with an nginx configuration,
an app/ directory with html/ and images/ directory that can
contain files to be served statically.  Additionally, it
creates a log directory for the nginx log.  To load start
up nginx with the configuration you can use:

  %> pgrep nginx | xargs kill -9
  %> nginx -c $(pwd)/site/nginx.conf
'''
  usage: "rstamp --generate rstamp-static-nginx-site"
}