rootpath="$(pwd)"
srcpath="$(pwd)/src"
cd $srcpath
files=$(ls -I "book.json" -I "node_modules")
for file in $files
do
  cd "$srcpath/$file"
  cp "$rootpath/book.json" book.json
  gitbook build
  mv _book "$rootpath/${file}"
  echo "-----${file}文档编译部署成功-----"
done
