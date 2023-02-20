import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";

dotenv.config();

import { insertUser, openSession } from "../repositories/auth.repository.js";
import { STATUS_CODE } from "../enums/statusCode.js";

async function signUp(req, res) {
  const { email, password, picture, username } = req.body;

  const passwordHash = bcrypt.hashSync(password, 12);

  try {
    await insertUser({ username, email, passwordHash, picture });

    res.sendStatus(STATUS_CODE.CREATED);
  } catch (error) {
    res.status(STATUS_CODE.SERVER_ERROR).send(error);
  }
}

async function signIn(req, res) {
  const { user } = res.locals;
  const { password } = req.body;
  const userId = user.id;
  const picture = user.picture;
  const username = user.username;

  const token = jwt.sign(
    {
      userId: userId,
    },
    process.env.TOKEN_SECRET,
    {
      expiresIn: 3600 * 2,
    }
  );

  try {
    if (bcrypt.compareSync(password, user.password)) {
      await openSession({ token, userId });

      res.status(STATUS_CODE.OK).send({ token, picture, userId, username });
    } else {
      res.sendStatus(STATUS_CODE.UNAUTHORIZED);
    }
  } catch (error) {
    res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

function auth(req, res) {
  res.sendStatus(STATUS_CODE.OK);
}

export { signUp, signIn, auth };
