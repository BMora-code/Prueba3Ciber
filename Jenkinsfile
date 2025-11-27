pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git(
                    branch: 'main',
                    credentialsId: 'github-token', // solo si usas token
                    url: 'https://github.com/BMora-code/Prueba3Ciber.git'
                )
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Asegúrate de que el Dockerfile se llame exactamente "Dockerfile"
                    sh 'docker build -t eva3ocy-flask-app -f Dockerfile .'
                }
            }
        }

        stage('Init Database') {
            steps {
                script {
                    // Monta correctamente el volumen en Jenkins
                    sh 'docker run --rm -v $WORKSPACE/database.db:/app/database.db eva3ocy-flask-app python init_db.py'
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