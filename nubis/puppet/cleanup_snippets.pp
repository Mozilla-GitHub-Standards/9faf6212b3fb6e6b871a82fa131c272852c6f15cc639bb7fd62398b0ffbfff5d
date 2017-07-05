cron { 'cleanup-snippets':
  command => '/usr/bin/python /var/www/dpaste/manage.py cleanup_snippets > /dev/null',
  user    => 'root',
  hour    => '*',
  minute  => '*/30'
}
