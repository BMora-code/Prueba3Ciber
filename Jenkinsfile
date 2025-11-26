pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git(
                    branch: 'main',
                    credentialsId: 'github-token',
                    url: 'https://github.com/BMora-code/Prueba3Ciber.git'
                )
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t flask-task-manager .'
                }
            }
        }

        stage('Init Database') {
            steps {
                script {
                    sh 'docker run --rm -v $(pwd)/database.db:/app/database.db flask-task-manager python init_db.py'
                }
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                script {
                    sh 'docker-compose down || true'
                    sh 'docker-compose up -d --build'
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deploy successful!"
        }
        failure {
            echo "❌ Deploy failed!"
        }
    }
}
