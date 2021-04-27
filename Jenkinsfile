pipeline {
    agent any

    stages {
        stage('Build'){
            steps {
                sh 'docker build -t scoutnet/buildhost BuildHost'
                sh 'docker build -t scoutnet/cihost CiHost'
                sh 'docker build -t scoutnet/devhost DevHost'
                sh 'docker build -t scoutnet/php73 PHP/7.3'
                sh 'docker build -t scoutnet/php74 PHP/7.4'
                sh 'docker build -t scoutnet/bundlewrap Bundlewrap'
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
                    sh 'docker push scoutnet/cihost'
                    sh 'docker push scoutnet/devhost'
                    sh 'docker push scoutnet/bundlewrap'

                    sh 'docker tag scoutnet/buildhost scoutnet/buildhost:$TAG_NAME'
                    sh 'docker push scoutnet/buildhost:$TAG_NAME'

                    sh 'docker tag scoutnet/cihost scoutnet/cihost:$TAG_NAME'
                    sh 'docker push scoutnet/cihost:$TAG_NAME'

                    sh 'docker tag scoutnet/devhost scoutnet/devhost:$TAG_NAME'
                    sh 'docker push scoutnet/devhost:$TAG_NAME'

                    sh 'docker tag scoutnet/php73 scoutnet/php73:$TAG_NAME'
                    sh 'docker push scoutnet/php73:$TAG_NAME'

                    sh 'docker tag scoutnet/php74 scoutnet/php74:$TAG_NAME'
                    sh 'docker push scoutnet/php74:$TAG_NAME'

                    sh 'docker tag scoutnet/bundlewrap scoutnet/bundlewrap:$(./Bundlewrap/currentBWVersion.sh)'
                    sh 'docker push scoutnet/bundlewrap:$(./Bundlewrap/currentBWVersion.sh)'

                    sh 'docker tag scoutnet/bundlewrap scoutnet/bundlewrap:$(./Bundlewrap/currentBWVersion.sh -m)'
                    sh 'docker push scoutnet/bundlewrap:$(./Bundlewrap/currentBWVersion.sh -m)'
                }
            }
        }
        stage('Notify') {
            steps {
                slackSend color: 'good', message: 'Building DockerImage: Done'
            }
        }

    }
}
