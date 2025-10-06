// Jenkinsfile (escrito en Groovy)
pipeline {
    agent any
    environment {
        // Definir variables de entorno si es necesario
        DOCKER_IMAGE = 'mi-repo/hello-devops:${BUILD_ID}'
    }
    stages {
        stage('Build Java Application') {
            steps {
                echo 'Iniciando compilación y empaquetado del JAR...'
                withMaven(maven: 'M3') {
                sh  'mvn clean package -DskipTests'
                }
            }
        }

        stage('Run Python Tests') {
            steps {
                echo 'Ejecutando pruebas de validación con Python...'
                sh 'python run_tests.py'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Construyendo la imagen Docker...'
                sh 'docker build -t ${DOCKER_IMAGE} .'
            }
        }

        stage('Deploy Application') {
            steps {
                echo 'Desplegando la nueva versión...'
                sh 'docker stop hello-devops || true'
                sh 'docker rm hello-devops || true'
                sh 'docker run -d --name hello-devops -p 8081:8081 ${DOCKER_IMAGE}'
            }
        }
    }
}