import bcrypt from "bcrypt";

import { insertUser } from "../repositories/sign.repository.js";
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

export { signUp };
