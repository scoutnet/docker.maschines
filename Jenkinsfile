pipeline {
    agent any

    stages {
        stage('Build'){
            steps {
                sh 'docker build -t scoutnet/buildhost BuildHost'
                sh 'docker build -t scoutnet/cihost CiHost'
                sh 'docker build -t scoutnet/devhost DevHost'
                sh 'docker build -t scoutnet/bundlewrap Bundlewrap'
            }
        }
        stage('Deploy'){
            when {
                expression {
                   env.BRANCH_NAME == 'master'
                }
            }
            steps {
                sh 'docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"'
                sh 'docker push scoutnet/buildhost'
                sh 'docker push scoutnet/cihost'
                sh 'docker push scoutnet/devhost'
                sh 'docker push scoutnet/bundlewrap'
            }
        }
    }
}
