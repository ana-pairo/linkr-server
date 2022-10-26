import { STATUS_CODE } from "../enums/statusCode.js";
import { followSCHEMA } from "../schemas/followSchema.js";
import { checkUsers } from "../repositories/follow.repository.js";

async function followMiddleware(req, res, next) {
  if (!req.body.followed || !req.body.follower) {
    res.sendStatus(STATUS_CODE.BAD_REQUEST);
    return;
  }
  const { follower, followed } = req.body;

  const isBodyValid = followSCHEMA.validate(req.body, { abortEarly: false });

  if (isBodyValid.error) {
    const errors = isBodyValid.error.details.map((detail) => detail.message);

    res.status(STATUS_CODE.UNPROCESSABLE).send(errors);
    return;
  }

  try {
    const followerIsValid = (await checkUsers(follower)).rows[0];
    const followedIsValid = (await checkUsers(followed)).rows[0];

    if (!followedIsValid || !followerIsValid) {
      res.sendStatus(STATUS_CODE.BAD_REQUEST);
      return;
    }

    next();
  } catch (error) {
    res.sendStatus(STATUS_CODE.SERVER_ERROR);
    return;
  }
}

export { followMiddleware };
