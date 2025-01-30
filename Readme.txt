I assume (very dangerous) you use Docker Desktop.
Move to the folder where you extracted the zip file.

Create the containers on Docker Desktop:
docker-compose up -d

Copy the Mendix deployment package to the app container:
docker cp demoapp.mda demoapp_mx_app:/srv/mendix/data/model-upload/mendix.mda

Connect to the app container:
docker exec -it demoapp_mx_app su mendix -P -c "cd; /bin/bash"

Start the m2ee console:
m2ee

Unpack the Mendix deployment package:
unpack mendix.mda

Choose 'y' to overwrite.

Download the correct runtime used in the Mendix deployment package:
download_runtime

Now it's time to start the app:
start

You get a message that the database is not up to date, choose 'e' to execute and save. This populates the postgres database.

Last thing that has to be done is setting a password to MxAdmin. The password must comply to the security settings you are using in your project:
create_admin_user

The app should be available on http://localhost:8080

De logging of the m2ee console is send to the log of the docker conatiner.

Things to consider:
The app is not starting by itself, you have to login into the container and start the app. (m2ee start) 
But you can use cron to start the app. Login into the container:
crontab -e
Remove the # from the last line. 
CTRL-O to save
CTRL-X to exit
This should fix the auto start.

When updating the Mendix deployment package the app must be stopped.

You can clean the database in the m2ee console with the command:
emptydb
Now you can start with an empty database, you have to set the MxAdmin also.









