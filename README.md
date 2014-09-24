http://brat.nlplab.org/

BRAT requires you to configure usernames and passwords. You can specify these as environment variables when you run the container.

You will need to 

Run something like:

  docker run -d -p 80:80 -v /directory/on/host:/bratconfig -v/directory/on/host:/bratdata -e BRAT_USERNAME=brat -e BRAT_PASSWORD=brat -e BRAT_EMAIL=brat@example.com  cassj/brat:1.3 




