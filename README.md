# 🚀 Simple CI/CD Pipeline using Jenkins and Docker (Node.js App)

## 🎯 Objective
This project demonstrates how to set up a **Continuous Integration / Continuous Deployment (CI/CD)** pipeline using **Jenkins** for a simple **Node.js web application**.

---

## 🧰 Tools & Technologies Used
- **Windows 11**
- **VS Code**
- **Node.js & npm**
- **Git & GitHub**
- **Docker Desktop**
- **Jenkins (running inside Docker container)**

---

## 📁 Project Structure

jenkins_nodejs_demo/
├── app.js           # Simple Node.js application
├── package.json     # App dependencies and scripts
├── Dockerfile       # Docker image build instructions
├── Jenkinsfile      # Jenkins declarative pipeline script
└── README.md        # Project documentation

---


---

## ⚙️ Step 1: Prerequisites

1. **Install Node.js & npm**
   - Verify installation:
     ```bash
     node -v
     npm -v
     ```

2. **Install Git**
   - Verify:
     ```bash
     git --version
     ```

3. **Install Docker Desktop**
   - Ensure Docker is running before starting Jenkins.



---

##  Step 2: Create a Simple Node.js App

## In VS Code terminal:

1. mkdir jenkins_nodejs_demo

2. cd jenkins_nodejs_demo

3. npm init -y

### Add

  .. app.js
  
  .. package.json

**Run it locallyyy***

npm install

npm start

"""Then visit 👉 http:// localhost:3000"""

---

## 🐳 Step 3: Create Dockerfile and test build  locally

-- docker build -t nodejs_demo .

-- docker run -d -p 3000:3000 nodejs_demo

---

## 🧱 Step 4: Run Jenkins in Docker

###  Create Jenkins volume:

* docker volume create jenkins_home

### Run Jenkins container:

* docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v //var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts


#### Get initial admin password

* docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword


### Open Jenkins UI

* In browser go to: http:// localhost:8080

* Paste the initial admin password.

* When asked, choose Install suggested plugins.

* Create the first admin user when prompted (username + password).


### Create a Jenkins Pipeline job that uses your GitHub repo

1. Jenkins Dashboard → New Item.

2. Enter name: jenkins-nodejs-demo → select Pipeline → OK.

3. In the job configuration:

*   In General section you can add description.

*   In Pipeline section:

*   Definition: choose Pipeline script from SCM

*   SCM: Git

*  Repository URL: https: //github.com/<YOUR_USERNAME>/jenkins-nodejs-demo.git

*  Branch: main

*  Script Path: Jenkinsfile (default)

* Save.

"""Now you can click Build Now to test."""


### Test run locally (first pipeline run)

1. In Jenkins job page click Build Now.

2. Click the running build → Console Output to follow logs.

3. What to expect:

 * Checkout code

 * npm install completes

 * npm test prints Tests passed

 * docker build builds image

 * docker run starts container mapping port 3000

4. Verify app is running by visiting:

   http:// localhost:3000

"""You should see: Hello from Jenkins CI/CD Pipeline!"""


<img width="956" height="507" alt="image" src="https://github.com/user-attachments/assets/6491edd2-3171-41e5-8ea6-7f4e853e1578" />



### You should see: Hello from Jenkins CI/CD Pipeline!


<img width="959" height="358" alt="image" src="https://github.com/user-attachments/assets/ff05c21b-4960-41c2-83eb-cad98bdfee9f" />



---

 #### Make pipeline auto-trigger on GitHub pushes (webhook)


1. Install GitHub Integration Plugin in Jenkins.

2. In your repo → Settings → Webhooks → Add Webhook

  * Payload URL: http:// localhost:8080/github-webhook/

  * Content type: application/json

  *  Select: “Just the push event”

3. Save.

"""Now Jenkins will automatically build when you push to GitHub"""

