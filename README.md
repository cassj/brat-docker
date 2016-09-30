http://brat.nlplab.org/

Start by creating a named volume and populating it with whatever data you need, either from within the container
something like:

  docker run --name=brat-tmp -it -v brat-data:/bratdata cassj/brat /bin/bash
  cd /bratdata
  wget http://my.url/some-dataset.tgz
  tar -xvzf some-dataset.tgz
  exit  
  docker rm brat-tmp

Or, if you have data on the host machine, you can check where docker is keeping the named volume with: 

  docker volume inspect brat-data 

and you can just copy the data into there from your host.

Then you can run the server something like: 

  docker run --name=brat -d -p 80:80 -v brat-data:/bratdata -e BRAT_USERNAME=brat -e BRAT_PASSWORD=brat -e BRAT_EMAIL=brat@example.com  cassj/brat

Notes:

Specify a username, password and email address for BRAT as environment variables when you start the container. This user will have editor permissions. 
 
We are using a docker named volume, mounted in the container to /bratdata, to hold the data for brat to work on. 
This will persist even if you stop and rm the brat container. 
You can then start another brat container as above and you should see the same data. 

If you are using docker < 1.9.0 named volumes are not available and you'll have to use a data-only container and 
--volumes-from instead.

