<h1>Setting up MySQL Server on an Ubuntu Operating System running on Azure</h1>


<h2>Setting up a workbench in Ubuntu OS </h2>

Step 1: Download the SQL workbench for your Linux System here https://dev.mysql.com/downloads/repo/apt/


Step 2: Open your terminal and navigate to the folder where you have downloaded the workbench using <b>cd Foldername</b>


        cd Downloads


Step 3: From the path above run the workbench installation command below (i.e ./fileNameOfInstallationPackage)

        sudo apt-get install ./Mysql-apt-config_0.8.20-1_all.deb 
        
#### Configuring the Mysql Workbench

> On running the command a pop up comes up, click ok to continue

![Mysql_config](https://github.com/olasunkanmi22/datafundamentals/blob/d5eea680abc3952c5bd3b3baa3573dd000a0303e/images/Mysql%20config%20start.png)


> Then the apt-config

![Mysql config start](https://github.com/relianceinfo-de/das-onboarding/blob/Ridwanbranch/Databases/Mysql/images/Mysql%20config%20start.png)



Step 4: Update the apt-config

       sudo apt-get update
       
![apt-config update](https://github.com/relianceinfo-de/das-onboarding/blob/Ridwanbranch/Databases/Mysql/images/update%20apt_install.png)


Step 5: Install Mysql Workbench Community
        
        Sudo snap install mysql-workbench-community
![Mysql Workbench Installation](https://github.com/relianceinfo-de/das-onboarding/blob/Ridwanbranch/Databases/Mysql/images/install%20mysql%20workbench.png)


Step 6: Install Mysql Server, click yes to continue when requested
        
        sudo apt install mysql-server
      

![Mysql Server Installation](https://github.com/relianceinfo-de/das-onboarding/blob/Ridwanbranch/Databases/Mysql/images/install%20mysql%20server.png)

Step 7: Confirm Server Installation and is running

        sudo systemctl status mysql
        
 ![Mysql Server Installation](https://github.com/relianceinfo-de/das-onboarding/blob/Ridwanbranch/Databases/Mysql/images/server_status_check.png)


Step 8: Check Mysql Version and login to the Mysql using the root login credentials
> Check the Mysql version 
        
               Mysql --version
               
> Login to the Mysql using the root login credentials
        
               Sudo mysql -u root -p
               
  ![Confirm Server Installation](https://github.com/relianceinfo-de/das-onboarding/blob/Ridwanbranch/Databases/Mysql/images/ensure_server_nstalled.png)
  
Step 9: Confirm what login technique root user use: 
        
        Select user, authentication_string,plugin, host FROM mysql.user;
        
  ![Login_Techniques](https://github.com/relianceinfo-de/das-onboarding/blob/Ridwanbranch/Databases/Mysql/images/confirm_authentication_techniques.png)
  
  
 In case the root user uses auth_socket you need to reconfigure that to either catching_sha2_password or native_password
  
        ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'Password123#@!';
        
        or
        
        ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Password123#@!';;

        
 Update the changes using command:
 
        FLUSH PRIVILEGES;
        
  
 
 Reconfirm if the authentication method is now changed accordingly
 
        SELECT user,authentication_string,plugin,host FROM mysql.user;
        
        
Step 10: In case you run into AppArmor blocker when trying to login into the server from the Workbench  

  ![AppArmor_Error](https://github.com/relianceinfo-de/das-onboarding/blob/Ridwanbranch/Databases/Mysql/images/AppArmor_logingConxError.png)

        
Run the below Command

        snap connect mysql-workbench-community:password-manager-service
        snap connect mysql-workbench-community:ssh-keys
        snap connect mysql-workbench-community:cups-control
        
Input a password for new keyring to ensure access to the workbench now

   ![Workbench_access_confirm](https://github.com/relianceinfo-de/das-onboarding/blob/Ridwanbranch/Databases/Mysql/images/Workbench_access_confirm.png)

        

<h3>References</h3>
<ol>
<li>How to Install SQL Workbench For MySQL on Linux?. https://www.geeksforgeeks.org/how-to-install-sql-workbench-for-mysql-on-linux/</li>
<li>Change Authentication Method For MySQL Root User In Ubuntu. https://ostechnix.com/change-authentication-method-for-mysql-root-user-in-ubuntu/</li>
<li>MySQL Workbench, Ubuntu 20.04 and App Armor. https://blockdev.io/mysql-workbench-ubuntu-20-04-and-app-armor/</li></ol>



```python

```
