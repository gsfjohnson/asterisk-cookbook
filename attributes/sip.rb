#
# Cookbook Name:: asterisk
# Attributes:: sip
#

default['asterisk']['sip']['context']              = 'default'
default['asterisk']['sip']['allowguest']           = 'yes'
default['asterisk']['sip']['allowoverlap']         = 'no'
default['asterisk']['sip']['allowtransfer']        = 'no'
default['asterisk']['sip']['realm']                = 'mydomain.com'
default['asterisk']['sip']['domain']               = 'mydomain.com'
default['asterisk']['sip']['bindport']             = 5060
default['asterisk']['sip']['bindaddr']             = '0.0.0.0'
default['asterisk']['sip']['tcpenable']            = 'yes'
default['asterisk']['sip']['srvlookup']            = 'yes'
default['asterisk']['sip']['pedantic']             = 'yes'
default['asterisk']['sip']['tos_sip']              = 'cs3'
default['asterisk']['sip']['tos_audio']            = 'ef'
default['asterisk']['sip']['tos_video']            = 'af41'
default['asterisk']['sip']['maxexpiry']            = '3600'
default['asterisk']['sip']['minexpiry']            = 60
default['asterisk']['sip']['defaultexpiry']        = 120
default['asterisk']['sip']['t1min']                = 100
default['asterisk']['sip']['notifymimetype']       = 'text/plain'
default['asterisk']['sip']['checkmwi']             = 10
default['asterisk']['sip']['buggymwi']             = 'no'
default['asterisk']['sip']['vmexten']              = 'voicemail'
default['asterisk']['sip']['disallow']             = 'all'
default['asterisk']['sip']['allow']                = %w(ulaw gsm ilbc speex)
default['asterisk']['sip']['mohinterpret']         = 'default'
default['asterisk']['sip']['mohsuggest']           = 'default'
default['asterisk']['sip']['language']             = 'en'
default['asterisk']['sip']['relaxdtmf']            = 'yes'
default['asterisk']['sip']['trustrpid']            = 'no'
default['asterisk']['sip']['sendrpid']             = 'yes'
default['asterisk']['sip']['progressinband']       = 'never'
default['asterisk']['sip']['useragent']            = 'Asterisk with Adhearsion'
default['asterisk']['sip']['promiscredir']         = 'no'
default['asterisk']['sip']['usereqphone']          = 'no'
default['asterisk']['sip']['dtmfmode']             = 'rfc2833'
default['asterisk']['sip']['compactheaders']       = 'yes'
default['asterisk']['sip']['videosupport']         = 'yes'
default['asterisk']['sip']['maxcallbitrate']       = 384
default['asterisk']['sip']['callevents']           = 'no'
default['asterisk']['sip']['alwaysauthreject']     = 'yes'
default['asterisk']['sip']['g726nonstandard']      = 'yes'
default['asterisk']['sip']['matchexterniplocally'] = 'yes'
default['asterisk']['sip']['regcontext']           = 'sipregistrations'
default['asterisk']['sip']['rtptimeout']           = 60
default['asterisk']['sip']['rtpholdtimeout']       = 300
default['asterisk']['sip']['rtpkeepalive']         = 60
default['asterisk']['sip']['sipdebug']             = 'yes'
default['asterisk']['sip']['recordhistory']        = 'yes'
default['asterisk']['sip']['dumphistory']          = 'yes'
default['asterisk']['sip']['allowsubscribe']       = 'no'
default['asterisk']['sip']['subscribecontext']     = 'default'
default['asterisk']['sip']['notifyringing']        = 'yes'
default['asterisk']['sip']['notifyhold']           = 'yes'
default['asterisk']['sip']['limitonpeers']         = 'yes'
default['asterisk']['sip']['t38pt_udptl']          = 'yes'

# Sensible defaults for public ip
default['asterisk']['public_ip'] = node['ec2'] ? node['ec2']['public_ipv4'] : node['ipaddress']
