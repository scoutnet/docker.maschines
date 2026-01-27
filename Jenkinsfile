pipeline {
    agent any

    stages {
        stage('Build'){
            steps {
                sh 'docker build -t scoutnet/buildhost BuildHost'
                sh 'docker build -t scoutnet/devhost DevHost'
                sh 'cd PHP/7.3 && make build'
                sh 'cd PHP/7.4 && make build'
                sh 'cd PHP/8.0 && make build'
                sh 'cd PHP/8.1 && make build'
                sh 'cd PHP/8.2 && make build'
                sh 'cd PHP/8.3 && make build'
                sh 'cd Bundlewrap && make build'
                sh 'echo "current Bundlewrap version is $(./Bundlewrap/currentBWVersion.sh)"'
            }
        }
        stage('Deploy'){
            when {
                expression {
                   env.TAG_NAME ==~ /(?i)(v[1234567890][.][1234567890][.][1234567890])/
                }
            }
            steps {
                withCredentials([usernamePassword(credentialsId: '89505d3f-4830-48fe-9595-b84743c5bb79', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"'

                    sh 'docker push scoutnet/buildhost'
                    sh 'docker push scoutnet/devhost'

                    // PHP
                    sh 'cd PHP/7.3 && make deploy'
                    sh 'cd PHP/7.4 && make deploy'
                    sh 'cd PHP/8.0 && make deploy'
                    sh 'cd PHP/8.1 && make deploy'
                    sh 'cd PHP/8.2 && make deploy'
                    sh 'cd PHP/8.3 && make deploy'

                    // Bundlewrap
                    sh 'cd Bundlewrap && make deploy'

                    // TAG versions
                    sh 'docker tag scoutnet/buildhost scoutnet/buildhost:$TAG_NAME'
                    sh 'docker push scoutnet/buildhost:$TAG_NAME'

                    sh 'docker tag scoutnet/devhost scoutnet/devhost:$TAG_NAME'
                    sh 'docker push scoutnet/devhost:$TAG_NAME'

                    sh 'docker tag scoutnet/php73 scoutnet/php73:$TAG_NAME'
                    sh 'docker push scoutnet/php73:$TAG_NAME'

                    sh 'docker tag scoutnet/php74 scoutnet/php74:$TAG_NAME'
                    sh 'docker push scoutnet/php74:$TAG_NAME'

                    sh 'docker tag scoutnet/php80 scoutnet/php80:$TAG_NAME'
                    sh 'docker push scoutnet/php80:$TAG_NAME'

                    sh 'docker tag scoutnet/php81 scoutnet/php81:$TAG_NAME'
                    sh 'docker push scoutnet/php81:$TAG_NAME'

                    sh 'docker tag scoutnet/php82 scoutnet/php82:$TAG_NAME'
                    sh 'docker push scoutnet/php82:$TAG_NAME'

                    sh 'docker tag scoutnet/php83 scoutnet/php83:$TAG_NAME'
                    sh 'docker push scoutnet/php83:$TAG_NAME'

                    sh 'docker tag scoutnet/bundlewrap scoutnet/bundlewrap:$(./Bundlewrap/currentBWVersion.sh)'
                    sh 'docker push scoutnet/bundlewrap:$(./Bundlewrap/currentBWVersion.sh)'

                    sh 'docker tag scoutnet/bundlewrap scoutnet/bundlewrap:$(./Bundlewrap/currentBWVersion.sh -m)'
                    sh 'docker push scoutnet/bundlewrap:$(./Bundlewrap/currentBWVersion.sh -m)'
                }
            }
        }
    }
    post {
        always {
            script {
                if (currentBuild.currentResult == 'FAILURE') {
                    color = 'danger'
                } else {
                    color = 'good'
                }
                slackSend color: color, message: "<${env.JOB_URL}|${env.JOB_NAME}>: Build ${currentBuild.currentResult}"
            }
        }
    }
}
