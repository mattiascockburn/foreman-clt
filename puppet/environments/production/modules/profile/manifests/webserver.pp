class profile::webserver() inherits profile::base {
include apache
include webapp
Class['apache'] -> Class['webapp']
}
