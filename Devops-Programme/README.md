# Hands-On – GIT (Distributed Version Control System)
## Hands-On (GIT)

### Steps:
- Create GitHub Account – https://github.com
- Create a Github empty repository
- GIT installation on Windows/Mac/Linux – https://git-scm.com/downloads
- Invoke Gitbash (Windows) / Terminal (Mac) / Linux

```
$> mkdir <folder>
$> cd <folder>
$> git –version
$> git status
```

<i>[You will get a <b>fatal error</b>: saying that it is not a git local repository ]</i>

```
$> git init
$> git status
$> git config –list
$> git config –global user.name “your github user name”
$> git config –global user.email “your github registered email-id”
$> git config –list
$> touch file1.txt
$> echo “This is the first line of the file ‘file1.txt’ ” > file1.txt
$> git status
$> git add .
$> git status
$> git commit -m “This is my first commit on file1.txt“
$> git log –oneline
$> git config –list
$> git branch
```

<i>Steps: Contd…</i>

```
$> git branch –all
Create few files using vi and echo
$> vi myfirstfile
$> cat myfirstfile
$> git status
$> echo “This is the second file by name ‘mysecondfile’ ” > mysecondfile
$> vi mysecondfile
$> echo “This is the line added/appended to the end of the file ‘mysecondfile’ ” >> mysecondfile
$> cat mysecondfile
$> git status
$> git add .
$> git commit -m “This is my second commit #2”
$> git status
$> git branch –all
$> vi my3rdfile
$> cp my3rdfile my4thfile
$> cat my4thfile
$> git add my3rdfile
$> git commit -m “this is commit#1 for my3rdfile changes”
$> git status
$> git log –oneline
$> git remote add origin https://github.com/<account-name>/<repositoryname.git>
$> git config –list
$> git remote -v
$> git push origin master
```

<i>Check the Github repository -> You should be able to find all the files pushed from the local repository to the Github remote repository</i>

