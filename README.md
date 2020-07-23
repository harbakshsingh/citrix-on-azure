#Confiugre git
git config user.email harry_ieee@yahoo.co.in
git config --global user.name harbaksh


#Initialize git in the directory
git init

#Add local files to repo
git add .

#Check status
git status

# Add remote origin
    git remote add origin https://github.com/harbakshsingh/citrix-on-azure

#check remote origin master branch
git remote -v


#Sometimes may need to pull origin master branch if you get error that you are ahead of the branch
git pull origin master --allow-unrelated-histories
git pull --tags origin master

#Push the files to remote branch
git push -u origin master

#If get error about upstream not being set
git push --set-upstream origin master

#If need to modify and delete the remote configured origin
git remote remove origin

#Check git status
git status

#List files in repo
git ls-files
git commit -m "first-commit"


#to remove speciifc files
git rm .terraform/plugins/windows_amd64/terraform-provider-azurerm_v1.38.0_x4.exe

#Add files to ignore into .gitignore
touch .gitignore
#modify the git ignore file to add the file you would like to ignore or just use git rm <filename> to remove it before committing and pushing

#working with large files.. if file size is more than 100Mb the push will fail for that install 
git lfs install

#add large files in git lfs repo to track
git lfs track "*.exe"
git lfs track "*.terraform-provider"
git add .gitattributes
git lfs migrate info
git lfs track "*.exe"git lfs migrate import --include="*.exe,*.terraform-provider"
git lfs migrate import --include="*.exe,*.terraform-provider"
git lfs migrate info --include-ref=master

#Clearing files from repo
git reset --soft HEAD~1
git reset HEAD .terraform/plugins/linux_amd64/terraform-provider-azurerm_v1.38.0_x4
git rm --cached .terraform/plugins/linux_amd64/terraform-provider-azurerm_v1.38.0_x4


##working off another branch

 git branch -r
 git remote -v
 git remote add origin https://github.com/harbakshsingh/citrix-on-azure
 git remote remove origin
 git remote add origin https://github.com/harbakshsingh/citrix-on-azure
 git branch -r
 git fetch origin
 git branch -r

 #Create local branch. Below example will create a new branch called Citrix_Azure_Terraform_Harbaksh
 git branch Citrix_Azure_Terraform_Harbaksh origin/master
 git checkout Citrix_Azure_Terraform_Harbaksh

 #To merge changes from  existing remote branch into new local branch. Below will merge and copy all the files from Citrix_Azure_Terraform_Bikram to new branch named Citrix_Azure_Terraform_Harbaksh
 git merge origin/Citrix_Azure_Terraform_Bikram


#To modify and overwite data into an existing branch
git branch -r
#Checkout existing branch
git checkout Citrix_Azure_Terraform_Bikram

#See list of files that will be updated on remote branch that has been checked out after commit
git ls-files
#Delete any large files from the git staging area (these large files may exist in temp directories of local folder in which git init was run). Wont remove the file iteself. only removes from git staging; means git wont push these files to the remote repo
git rm -f .terraform/plugins/linux_amd64/lock.json
git rm -f .terraform/plugins/linux_amd64/terraform-provider-azurerm_v1.38.0_x4
git rm -f .terraform/plugins/linux_amd64/terraform-provider-azurerm_v1.38.0_x4.exe

git commit -m "commiting harbaksh changes to bikram's branch"

git status
