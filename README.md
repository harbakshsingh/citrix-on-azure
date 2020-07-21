#This repo contains code to deploy Citrix Netscaler adc on Azure

Login to azure using 'az login'

Run below commands :
1. Download the terraform providers
terraform init
2. Run the plan
terraform plan
3. Execute the plan and configure netscaler on Azure
terraform apply --auto-approve


#Install and work with git

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


