# Submission Reminder App

##  Introduction
This script automates the process of setting up a submission reminder system. It creates necessary directories, configures environment files, and provides scripts to check assignment submissions.

##  Setup Instructions
Follow these steps to install and run the app:

### 1️⃣ Clone the Repository
```bash
git clone <repository_url>
cd submission_reminder_app
```

### 2️⃣ Make the `create` Script Executable
Before running the script, ensure it has execution permissions:
```bash
chmod +x create
```

### 3️⃣ Run the Setup Script
Execute the `create` script to generate the necessary directories and files:
```bash
./create
```
You'll be prompted to enter your name. This will create a personalized directory structure.

### 4️⃣ Navigate to Your App Directory
After running the `create` script, a new directory will be created with the format:
```bash
submission_reminder_<your_name>
```
Navigate into it:
```bash
cd submission_reminder_<your_name>
```

### 5️⃣ Make Scripts Executable
Ensure that all generated scripts have execution permissions:
```bash
chmod +x app/reminder.sh
chmod +x modules/functions.sh
chmod +x startup.sh
```

### 6️⃣ Run the Reminder App
Start the app using:
```bash
./startup.sh
```
This will load environment variables and check assignment submissions.

##  Troubleshooting
- **Permission Denied?** Run:
  ```bash
  chmod +x create
  ```
- **Script Errors?** Ensure all scripts are properly formatted and have execution permissions.

##  License
This project is open-source and available for modification.


