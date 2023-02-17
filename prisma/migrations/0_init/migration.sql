-- CreateTable
CREATE TABLE "comments" (
    "id" SERIAL NOT NULL,
    "postId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "comments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "follows" (
    "id" SERIAL NOT NULL,
    "followerId" INTEGER NOT NULL,
    "followedId" INTEGER NOT NULL,

    CONSTRAINT "follows_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "likes" (
    "id" SERIAL NOT NULL,
    "postId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "likes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "posts" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "link" TEXT NOT NULL,
    "description" TEXT,
    "originalId" INTEGER,

    CONSTRAINT "posts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "posts_trends" (
    "id" SERIAL NOT NULL,
    "trendId" INTEGER NOT NULL,
    "postId" INTEGER NOT NULL,

    CONSTRAINT "posts_trends_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sessions" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "token" TEXT NOT NULL,
    "createTime" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "sessions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "trends" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(30) NOT NULL,

    CONSTRAINT "trends_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "picture" TEXT NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "sessions_token_key" ON "sessions"("token");

-- CreateIndex
CREATE UNIQUE INDEX "trends_name_key" ON "trends"("name");

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_postId_fkey" FOREIGN KEY ("postId") REFERENCES "posts"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_userid_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "follows" ADD CONSTRAINT "follows_followedId_fkey" FOREIGN KEY ("followedId") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "follows" ADD CONSTRAINT "follows_followerId_fkey" FOREIGN KEY ("followerId") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "likes" ADD CONSTRAINT "likes_postId_fkey" FOREIGN KEY ("postId") REFERENCES "posts"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "likes" ADD CONSTRAINT "likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "posts_trends" ADD CONSTRAINT "posts_trends_postId_fkey" FOREIGN KEY ("postId") REFERENCES "posts"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "posts_trends" ADD CONSTRAINT "posts_trends_trendId_fkey" FOREIGN KEY ("trendId") REFERENCES "trends"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "sessions" ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

