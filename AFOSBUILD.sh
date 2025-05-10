
go build -ldflags="-X 'main.version=v3.1.1'" -o s3scanner

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Go build... PASS!"
else
  # houston we have a problem
  exit 1
fi

strip s3scanner

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "STRIP... PASS!"
else
  # houston we have a problem
  exit 1
fi

cp -Rf s3scanner /opt/ANDRAX/bin

chown -R andrax:andrax /opt/ANDRAX
chmod -R 755 /opt/ANDRAX
