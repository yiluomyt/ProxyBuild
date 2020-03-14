# 当不存在博客框架时，重新clone
if [ ! -d "MokeBlog" ]; then
  echo "--- Clone Blog Framework ---"
  git clone https://gitee.com/myyiluo/MokeBlog.git
fi

# 更新博客框架
echo "--- Update Blog Framework ---"
cd MokeBlog
git fetch --all
git reset --hard origin/master
git pull

# 当不存在博客目录时，重新clone
if [ ! -d "content/blog" ]; then
  echo "--- Clone Blog Repo ---"
  git clone https://gitee.com/myyiluo/Blog.git content/blog
fi

# 更新博客内容
echo "--- Update Blog Repo ---"
cd content/blog
git fetch --all
git reset --hard origin/master
git pull
cd ../../

# 构建
echo "--- Build for Deploy ---"
npm install
npm run build
cd ..