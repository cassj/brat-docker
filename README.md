http://brat.nlplab.org/

BRAT requires you to configure usernames and passwords. You can specify these as environment variables when you run the container.

You will also need to provide data and config files. The container assumes these will be writable by the group 'bratadmin'

On the host:

mkdir /bratconfig /bratdata
addgroup bratadmin
chgrp bratadmin /bratconfig 
chgrp bratadmin /bratdata
chmod g+s /bratconfig
chmod g+s /bratdata
chmod g+rwx /bratconfig
chmod g+rwx /bratdata

Then run something like:

  docker run -d -p 80:80 -v /directory/on/host:/bratconfig -v/directory/on/host:/bratdata -e BRAT_USERNAME=brat -e BRAT_PASSWORD=brat -e BRAT_EMAIL=brat@example.com  cassj/brat:1.3 




