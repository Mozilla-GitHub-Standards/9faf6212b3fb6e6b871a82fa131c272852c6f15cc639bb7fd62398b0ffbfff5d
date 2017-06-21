# After 2.8
try:
  from dpaste.settings.base import *
# 2.8 and before
except:
  from dpaste.settings import *

import imp
nubis = imp.load_source('nubis', '/etc/nubis-config/dpaste.sh')

DEBUG = False
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    #('webops', 'noreply@mozilla.com'),
)

ALLOWED_HOSTS = '*'

MANAGERS = ADMINS

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': nubis.DB_NAME,
        'USER': nubis.DB_USERNAME,
        'PASSWORD': nubis.DB_PASSWORD,
        'HOST': nubis.DB_SERVER,
    }
}

SECRET_KEY = nubis.APP_SECRET_KEY

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

DPASTE_SLUG_LENGTH = 16
DPASTE_SITE_NAME = paste.mozilla.org
