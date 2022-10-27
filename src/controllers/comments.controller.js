import { STATUS_CODE } from "../enums/statusCode.js";
import { getTotalPostCommentsByPostId , postCommentsByPostId} from "../repositories/comments.repository.js";

async function getComments(req, res) {
  const { postId } = res.locals;
  try {
    const comments = await getTotalPostCommentsByPostId(postId);

    return res.status(STATUS_CODE.OK).send(comments.rows);
  } catch (error) {
    return res.status(STATUS_CODE.SERVER_ERROR).send(error.message);
  }
}

async function postComments(req, res) {
  const { postId } = res.locals;
  const comment = req.body;

  try {
    await postCommentsByPostId(postId, comment.userId, comment.description);
    return res.sendStatus(STATUS_CODE.OK);
  } catch (error) {
    return res.status(STATUS_CODE.SERVER_ERROR).send(error.message);
  }
};

export { getComments, postComments };
