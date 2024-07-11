# Git



## git 架构



## 命令操作

### 1.仓库操作

#### 创建本地仓库

#### clone 远程仓库

### 2.分支操作

#### 创建本地分支

#### 拉取远程分支

#### 从分支创建新分支


### 其他

- 查看一共多少次提交

```shell
git rev-list --count HEAD
```

- 查看代码总行数

```shell
git ls-files | xargs cat | wc -l
```

- 将仓库代码全部合并到一个文件中

```shell
git archive --format=zip HEAD > project.zip
unzip -p project.zip | cat > code.txt
```