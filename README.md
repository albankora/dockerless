# Dockerless: serverless framework on docker

Boilerplate for running serverless framework on docker

## Build your app
```bash
./app build
```

## Run a docker command or a command inside docker
```bash
./app [COMMAND]
```

## Create new app
Create a new app base on a templates, `aws-nodejs` is the `nodejs` template for aws serverless
You can use different templates based on your language of preference and your cloud environment
```bash
./app sls create -t aws-nodejs
```

## Get all availiable commands
```bash
./app
```

## All availiable commands
```bash
Docker commands:
  stop               Stops docker containers
  config             Split out the docker-conpose file used
  logs   [PARAMS]    See docker logs, add param -f to tail logs
  rm     [PARAMS]    Remove docker containers, add -v to remove volumes also
  down   [PARAMS]    Stop and remove containers and networks, extra params:
                           -v to remove volumes
                           --rmi type [local, all] to remove images

Development commands:
  build              Build the docker container
  bash               Login to docker bash interface as ROOT
  exec   [COMMAND]   Run a command as ROOT inside the docker container
  sls    [COMMAND]   Run a serverless command inside doker
```

## Aws Credentials 
Serverless credentials docs: (https://serverless.com/framework/docs/providers/aws/guide/credentials/)

1. Create a aws user
2. Create aws policies if required
3. Attach polices to user directly or assign user to a group with existing polices 
4. Goto `security credentials` tab and create an access key
5. Update `.env` file with your AWS credentials

## Deploy your app
If your credentials are setup correctly then run:
```bash
./app sls deploy
```
 and your app will be packed and deploy to the right enviroment base on `serverless.yml`
 