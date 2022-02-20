# Web Server CI/CD Pipeline

## A simple go lang server

The goal of this repo is to learn about GitHub actions and automate the build and push process of my docker image.

## Step 1: Dockerise your project

The very first step is to have a project ready that could run on Docker. Here, I have made a simple go web server. You can add your web pages to the `public` folder. I [cloned](https://github.com/learning-zone/website-templates) and edited a small website for the demonstration purpose.

Using `Dockerfile` I can generate the docker image. After running this command, you can see the website up and running.

```bash
docker run -d -t -p 8080:8080 jammutkarsh/go-web-server
```

## Step 2: Testing the build locally

This is not an actual step, but it will enable you to know the workflow when designing the workflow in `.github/workflows`

Go to the project directory

```bash
  git clone https://github.com/JammUtkarsh/go-web-server && cd go-web-server
```

This is building the components from `Dockerfile`

```bash
  docker build . -t jammutkarsh/go-web-server
```

Logging into Docker CLI

```bash
  docker login -u username -p mySecretPass
```

```bash
  docker push jammutkarsh/go-web-server
```

## Step 3: Translating Step 2 into a GitHub Action

Open the `.yaml` file in `.github/workflows`.
It's pretty much readable, I'll explain a few bits to get yours working.

- `runs-on: ubuntu-latest` CI/CD piling is available on all 3 OS(Linux, Windows, and macOS). We are using Linux for obvious reasons.
- `- uses: actions/checkout@v2` This is the [detailed](https://stackoverflow.com/questions/67131269/github-jobs-what-is-use-actions-checkout) answer. In short, means that when you `push` your code(triggers `on: [push]`); the code from that last commit will be cloned into the machine. So you save steps like `git clone`, `cd repo`, etc.
- `env` adding your username and password will not be ideal in production. This is where [GitHub Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) comes in. We can define them with GitHub security and access them in our workflow.

# 🥳

Your CI pipeline is now working using GitHub Actions.

<br>

> If there is anything we must add or change in this document. Make changes and make a pull request.
