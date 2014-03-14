class profile::base() {
  include base::monitoring
  include base::tools
  class{'ntp':
    server_list => [ 'foreman.demo.int', ],
  }
  
}
