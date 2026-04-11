# replacempent

exec {'replace':
  command  =>  'sed -i "s/^ULIMIT.*/ULIMIT=\"-n 2048\"/" /etc/default/nginx',
  path     =>  '/bin',
  provider =>   'shell'
}

# nginx restart
exec {'restart':
  command =>  'nginx restart',
  path    =>  '/etc/init.d',
  require =>  Exec['replace']
}
