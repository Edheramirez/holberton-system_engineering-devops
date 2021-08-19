# Installs nginx web server using puppet
package {'Install nginx':
    ensure => installed,
    name   => 'nginx',
}
file_line {'title':
    ensure   => 'present',
    path     => '/etc/nginx/sites-available/default',
    after    => 'listen 80 default_server;',
    line     => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=dQw4w9WgXcQ permanent;',
    multiple => true,
}
file {'path':
    content => 'Holberton School',
    path    => '/var/www/html/index.html',
}
service {'nginx':
    ensure  => running,
    require => Package['nginx'],
}
