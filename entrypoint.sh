#!/bin/sh

# Checking MyJDownloader file
FILE_CONFIG="/app/JDownloader/cfg/org.jdownloader.api.myjdownloader.MyJDownloaderSettings.json"
FILE_SETTING="/app/JDownloader/cfg/org.jdownloader.settings.GeneralSettings.json"
echo "##################################"
echo "#Checking MyJDownloader file"
echo "##################################"
if [ ! -f $FILE_CONFIG ]; then
        echo "MyJDownloader config file does not exist, creating...."
        mkdir /app/JDownloader/cfg/
        printf '{\n"autoconnectenabledv2" : true,\n"manualremoteport" : 3129,\n"manuallocalport" : 3129,\n"devicename" : "devicename",\n"password" : "password",\n"email" : "email"\n}' > $FILE_CONFIG
        printf '{\n"defaultdownloadfolder" : "/app/JDownloader/Downloads"\n}' > $FILE_SETTING
        echo "Done..."
fi

echo "######################################################"
echo "#Adding personal info to MyJDownloader config file... "
echo "######################################################"
echo "EMAIL: " $EMAIL
echo "PASSWORD: ********** "
echo "DEVICENAME: " $DEVICENAME
sed -Ei "s/\"devicename\" : [^,]+/\"devicename\" : \"$DEVICENAME\"/" $FILE_CONFIG && \
sed -Ei "s/\"password\" : [^,]+/\"password\" : \"$PASSWORD\"/" $FILE_CONFIG && \
sed -Ei "s/\"email\" : [^,]+/\"email\" : \"$EMAIL\"/" $FILE_CONFIG
sleep 10
echo "#########################################"
echo "#Done..."
echo "#########################################"

# Checking JDownloader is Updating
echo "##################################"
echo "#Checking JDownloader is Updating"
echo "##################################"
FILE_INIT=/app/JDownloader/JDownloader.jar
if [ ! -f $FILE_INIT ]; then
        rm -f /app/JDownloader/JDownloader.jar.*
        rm -f /app/JDownloader/JDownloader.pid
        cp /app/JDownloader/tmp/update/self/JDU/JDownloader.jar /app/JDownloader/
        java -Djava.awt.headless=true -jar /app/JDownloader/JDownloader.jar
        echo ""
        echo "#Updating... Wait..."
        while [ -d /app/JDownloader/tmp/update/self/JD ]; do sleep 2; done
        ps axf | grep java | grep -v grep | awk '{kill -9 $1}'
        echo "####################"
        echo "#Update Complete..."
        echo "####################"
fi
echo "#########################################"
echo "#Done..."
echo "#########################################"

# Normal Initialize
echo "#########################################"
echo "#Running JDownloader 2"
echo "#########################################"
echo $(java -Djava.awt.headless=true -jar /app/JDownloader/JDownloader.jar)