pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', credentialsId: 'github-login' ,url: 'https://github.com/nathanvo1489/Proj_ToDoList.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t js_express_be_image ./backend'
            }
        }

        // stage('Deploy Container') {
        //     steps {
        //         sh'''
        //             docker rm go_gin_be -f || true
        //             docker run --name go_gin_be -d -p 8002:8080 go_gin_be_image
        //         '''
        //     }
        // }
        
        stage('Deploy Container') {
            steps {
                // chuyển image qua bên server run docker save | load
                sh'''
                '''
            }
        }
    }
}