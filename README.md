# Brightwheel Mailer Adapter

## Installation

1. Install Crystal Language
2. Run `shards build` from the root of the project

## Runing the Service

> Note: The service is a precompiled program that can be run by simply executing `./bin/brightwheel` from the root of the project directory using a terminal.

1. Run `source .env` from console and project root to load the environment
   variables (Using bash)
2. Run `./bin/brightwheel` to start the service

## Running tests

From the project root using a console/terminal:

Console 1:

1. Run `shards build`
2. Run `source .env`
3. Run `./bin/brightwheel`

Console 2:

1. Run `source .env` from console and project root to load the environment
   variables (Using bash)
2. Run `crystal spec`

### Language

The language choosen is Crystal Language.

Why: I choose this language because of code readability, type safe and speed. In a
real world application I would choose GO Lang, Ruby or Java, in that order.

### Framework

Azu Framework - https://github.com/azutoolkit/azu

Why: The framework chosen offer me to write simple programs with little boiler plate code. The framework allows me to choose my preferred project organizational structure for the project at hand. Note I am a big fan of this programming language, and I wrote the AmberFramework which is the second most used framework in the language for web/api development. I have also written AZU based on my learning experience from Amber (https://amberframework.org/).

### Libraries

**Halite**

Allows me to write HTTP Requests with a chainable REST API, built-in sessions and middleware

### Tradeoffs

I would like to understand better the requirements around the resiliency needed
so that I can better organize the adapter layer, there are ways to load the right
adapter dynamically for retries and ensure delivery.

Another observation, I noticed that one of the requirements state as follows:
`Convert the body HTML to a plain text version to send along to the email provider.`

I purposely left this out because I did not see it being used currently. Not sure if I am missing something. I assuming this will be used later on and I will rather
wait until then to implement it.

Service configuration uses environment variables this is to follow best practices as stated in the 12 factor principles for portability and configuration https://12factor.net/

When designing APIs I like to follow API Design first approach in which I create an open api spec for this case I did not deem it necessary, so I left this out for the interview.

## Contributing

1. Fork it (<https://github.com/your-github-user/brightwheel/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Elias Perez](https://github.com/your-github-user) - creator and maintainer
