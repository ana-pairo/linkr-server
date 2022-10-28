import { getPostById } from "../repositories/likes.repository.js";

async function validatePostId(req, res, next) {
  const { postId } = req.params;

  try {
    const postExists = (await getPostById(postId)).rows;
    if (!postExists.length) return res.status(404).send("Post does not exist");
    res.locals.postId = postId;
    res.locals.postExists = postExists;

    next();
  } catch (error) {
    return res.status(500).send(error);
  }
}

function getOriginalPostId(req, res, next) {
  const { postExists, postId } = res.locals;

  let referencePostId;
  postExists[0].originalId
    ? (referencePostId = postExists[0].originalId)
    : (referencePostId = postId);

  res.locals.postId = referencePostId;

  next();
}

export { validatePostId, getOriginalPostId };
