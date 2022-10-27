import {
  checkIfPostIsPostedByUser,
  deletePostData,
  updatePostData,
  insertPostData,
} from "../repositories/posts.repository.js";
import { postSchema, postUpdateSchema } from "../schemas/postSchema.js";
import {
  getUserById,
  getPostsByUser,
  getAllPosts,
  getQuantPosts,
  getAllFollowingUsers,
} from "../repositories/users.repository.js";
import urlMetadata from "url-metadata";

async function updatePost(req, res) {
  const validation = postUpdateSchema.validate(req.body, { abortEarly: false });
  if (validation.error) {
    const errors = validation.error.details.map((detail) => detail.message);
    return res.status(422).send(errors);
  }

  const { postId, userId } = res.locals;
  const { newDescription, newTrends } = req.body;

  try {
    const postCheck = await checkIfPostIsPostedByUser(postId, userId);
    if (!postCheck.rowCount)
      return res.status(401).send("Post not made by user");

    await updatePostData(postCheck.rows[0].id, newDescription, newTrends);

    return res.sendStatus(204);
  } catch (error) {
    return res.status(500).send(error);
  }
}

async function deletePost(req, res) {
  const { postId, userId } = res.locals;

  try {
    const postCheck = await checkIfPostIsPostedByUser(postId, userId);
    if (!postCheck.rowCount)
      return res.status(401).send("Post not made by user");

    await deletePostData(postCheck.rows[0].id);

    return res.sendStatus(202);
  } catch (error) {
    return res.status(500).send(error);
  }
}

async function createPost(req, res) {
  const { link, description, trends } = req.body;
  const validation = postSchema.validate(req.body);

  if (validation.error) {
    const errors = validation.error.details.map((detail) => detail.message);
    return res.status(422).send(errors);
  }

  const urlTester = new RegExp(
    "^(https?:\\/\\/)?" +
      "((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|" +
      "((\\d{1,3}\\.){3}\\d{1,3}))" +
      "(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*" +
      "(\\?[;&a-z\\d%_.~+=-]*)?" +
      "(\\#[-a-z\\d_]*)?$",
    "i"
  );

  if (!urlTester.test(link)) {
    return res.status(422).send("URL inválida!");
  }

  const { userId } = res.locals;

  try {
    await insertPostData(userId, link, description, trends);

    return res.sendStatus(201);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

async function postsByUser(req, res) {
  const { id } = req.params;

  try {
    const user = (await getUserById(id)).rows;
    if (!user.length) return res.status(404).send("User not found");

    const posts = (await getPostsByUser(user[0].id)).rows;

    const postsData = [];

    for (let i = 0; i < posts.length; i++) {
      postsData.push(await InsertIntoPostDataUrlMetadata(posts[i]));
    }

    return res.status(200).send({
      user: { userId: user[0].id, username: user[0].username, picture: user[0].picture },
      posts: postsData,
    });
  } catch (error) {
    return res.status(500).send(error.message);
  }
}

async function allPosts(req, res) {
  const { number } = req.params;
  const { userId } = res.locals;
  if (isNaN(number)) return res.status(400).send("Not a number");

  try {
    let posts = (await getAllPosts({ userId, number })).rows;
    const followingUsers = (await getAllFollowingUsers({ userId })).rows[0];
    let following;

    if (followingUsers) {
      following = true;
    } else {
      following = false;
    }

    const postsData = [];

    for (let i = 0; i < posts.length; i++) {
      postsData.push(await InsertIntoPostDataUrlMetadata(posts[i]));
    }

    let postQ = (await getQuantPosts()).rows;

    const data = { posts: [...postsData], following, quant: postQ[0].quant };

    return res.status(200).send(data);
  } catch (error) {
    return res.status(500).send(error.message);
  }
}

async function quantPosts(req, res) {
  try {
    let posts = (await getQuantPosts()).rows;

    return res.status(200).send(posts[0].quant);
  } catch (error) {
    return res.status(500).send(error.message);
  }
}

async function InsertIntoPostDataUrlMetadata(postData) {
  const link = postData.link;
  const metadata = await urlMetadata(link);

  postData.linkTitle = metadata.title;
  postData.linkDescription = metadata.description;
  postData.linkImage = metadata.image;

  return postData;
}

export {
  updatePost,
  deletePost,
  createPost,
  postsByUser,
  allPosts,
  InsertIntoPostDataUrlMetadata,
  quantPosts,
};
