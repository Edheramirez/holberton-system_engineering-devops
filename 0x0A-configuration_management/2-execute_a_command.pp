# Execute a command

exec { 'pkill':
  command  => '/usr/bin/pkill -f killmenow',
  onlyif   => 'ps -aux | grep killmenow',
  provider => 'shell',
}