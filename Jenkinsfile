pipeline {
    agent { docker { image 'ruby:3.1.1' } }
    stages {
        stage('build') {
            steps {
                sh 'ruby --version'
            }
        }
    }
}