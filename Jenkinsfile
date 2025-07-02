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
					sh "docker build -t nodejs_alpine ."
					sh "docker start -it -d nodejs_alpine"
				}
            }
        }
        stage('push docker image to dockerhub') {
            steps {
                script{
					withCredentials([string(credentialsId: 'dockerpass', variable: 'dockerpass')]) {
					sh "docker login -u sparsh2324 -p ${dockerpass}"
}
					sh "docker push <dockerhubname/imagename>"
            }
        }
    }
}
