pipeline {
    agent any
	
	triggers{
		pollSCM('* * * * *') // Poll GitHub every minute (can be changed)
	}
        		
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Sparsh2324/Project'
            }
		}		
        stage('Build Docker image') {
            steps {
				script{
					sh "docker build -t sparsh2324/nodejs_alpine:latest ."
				}
            }
        }
        stage('push docker image to dockerhub') {
            steps {
                script{
					withCredentials([string(credentialsId: 'dockerpassword', variable: 'dockerpass')]) {
					sh "docker login -u sparsh2324 -p ${dockerpass}"
}
					sh "docker push sparsh2324/nodejs_alpine:latest"
				}
			}
		}
		stage('run docker image'){
		    steps{
		        script{
		            sh 'docker run -it -d --name nodejs_alpine sparsh2324/nodejs_alpine'
		            sh 'docker start nodejs_alpine'
		        }
		    }
		}
	}
}
