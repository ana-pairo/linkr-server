<h1 align="center">Linkr Server</h1>

This project was made using Node.js and Express and consists on an API used for a social network back-end workprocess.

## Features

1. Sign-up and sign-in with jwt authentication
2. User search
3. Publishing posts
4. Listing posts with pagination
5. Listing 10 most popular hashtahgs
6. Users' posts
7. Hashtags' posts
8. Post edition and deletion
9. Interactions with post (likes, comments and re-posts)

## Documentation

You can check project's simplified documentation [here](https://valley-beast-e3f.notion.site/Linkr-76f4767131244888b65b4f29e9f73e6f).

## Cloning project

Clone the project in your server with the following command:

### `git clone https://github.com/ana-pairo/linkr-server.git`

## Deploying application

1. Create a `.env` file in the root of the project. Populate it based on the `.env.example` file. Keep all the values already set in the `.env.example` and provide only the following:

   - `POSTGRES_USERNAME`
   - `POSTGRES_PASSWORD`
   - `POSTGRES_DATABASE`
   - `TOKEN_SECRET`
   - `DATABASE_URL`

2. The `DATABASE_URL` must be completed considering the pattern below:

   `postgresql://<POSTGRES_USERNAME>:<POSTGRES_PASSWORD>@<POSTGRES_HOST>:<POSTGRES_PORT>/<POSTGRES_DATABASE>?schema=public`

3. Create a self-signed certificate by running the following command at the `src/config/` level:

   `openssl req -nodes -new -x509 -keyout server.key -out server.cert`

   After running this command, you would get some options to fill. You can keep those options default or empty by entering ‘.‘ (dot).

   Make sure that both `server.key` and `server.cert` are created and inside the config folder.

4. Finally, at the root level of the project, run `docker compose up` to spin up the linkr server.

5. (Optional) Run `docker compose down -v` to stop the linkr server.
