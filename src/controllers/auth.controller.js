import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";

dotenv.config();

import { insertUser, openSession } from "../repositories/auth.repository.js";
import { STATUS_CODE } from "../enums/statusCode.js";

async function signUp(req, res) {
  const { username } = res.locals;
  const { email, password, picture } = req.body;

  const passwordHash = bcrypt.hashSync(password, 12);

  try {
    await insertUser({ username, email, passwordHash, picture });

    res.sendStatus(STATUS_CODE.CREATED);
  } catch (error) {
    res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

async function signIn(req, res) {
  const { user } = res.locals;
  const { password } = req.body;
  const userId = user.id;
  const picture = user.picture;

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

      res.status(STATUS_CODE.OK).send({ token, picture });
    } else {
      res.sendStatus(STATUS_CODE.UNAUTHORIZED);
    }
  } catch (error) {
    res.sendStatus(STATUS_CODE.SERVER_ERROR);
  }
}

function auth(req, res) {
  const token = req.headers.authorization?.replace("Bearer ", "");

  try {
    const verifyToken = jwt.verify(token, process.env.TOKEN_SECRET);
    res.status(STATUS_CODE.OK).send({ userId: verifyToken.userId });
  } catch (error) {
    res.sendStatus(STATUS_CODE.UNAUTHORIZED);
  }
}

export { signUp, signIn, auth };
