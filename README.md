# docker-emrs

# clone the repo
git clone https://github.com/alaluces/emrs.git

# build
docker build -t emrs .

# run
docker run --name emrs -d -p 80:80 --network=my_lan --hostname=emrs arieslaluces/emrs
