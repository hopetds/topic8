#!/bin/bash
cd /opt/topic8
#creating and clearing old folder
if ! [ -d /opt/topic8/old/ ]; then
mkdir old
else
rm -rf /opt/topic8/old/*.tar.gz
fi

#creating or clearing current
if ! [ -d /opt/topic8/current/ ]; then
mkdir current
else 
#moving to old
mv /opt/topic8/current/*tar.gz /opt/topic8/old/
cd current
fi

#copy fresh build to current
cp /opt/topic8/*tar.gz /opt/topic8/current/

#copy to current

if ! [ -d /opt/topic8/dist/ ]; then

mkdir dist
else 
rm -rf /opt/topic8/dist/*
fi

#deploy to jboss
cp /opt/topic8/current/*tar.gz /opt/topic8/dist
cd /opt/topic8/dist/
mkdir deploy
cd deploy
cp /opt/topic8/dist/*tar.gz /opt/topic8/dist/deploy/
tar -xzvf *tar.gz
rm -rf *tar.gz
#untaring and preparing folder to be deployed
mv ilya_khamiakou_topic8_step1/ ilya_khamiakou_topic8_step1.war
#undeploying
rm -rf /opt/jboss-eap-5.1/jboss-as/server/default/deploy/ilya_khamiakou_topic8_step1.war/
#deploying 
mv ilya_khamiakou_topic8_step1.war /opt/jboss-eap-5.1/jboss-as/server/default/deploy/
