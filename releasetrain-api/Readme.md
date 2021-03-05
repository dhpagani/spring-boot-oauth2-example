# Release Train API

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.

### Mainly docs

[GitHub Types](https://octokit.github.io/types.ts/) - show the mainly types (pay attention to the "generated")

## Installation

```bash
$ npm install
```

## Running the app

You must put a `ormconfig.json` file in the root of the project with the database connection

```
{
    "type": "oracle",
    "username": "release_train",
    "password": "xxxxxx",
    "connectString": "host:1521/servicename",
    "schema": "release_train",
    "entities": [
        "dist/**/*.entity{.ts,.js}"
    ],
    "autoLoadEntities": true
}

```

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

## Support

Nest is an MIT-licensed open source project. It can grow thanks to the sponsors and support by the amazing backers. If you'd like to join them, please [read more here](https://docs.nestjs.com/support).

## Stay in touch

-   Author - [Kamil Myśliwiec](https://kamilmysliwiec.com)
-   Website - [https://nestjs.com](https://nestjs.com/)
-   Twitter - [@nestframework](https://twitter.com/nestframework)

## License

Nest is [MIT licensed](LICENSE).
