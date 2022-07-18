def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
]
pipeline{
    agent any
    environment{
        DOCKER_USER = 'gautamjha3112002'

    }
    stages{
        stage('Fetch code'){
            steps{
                git branch: 'master', url: 'https://github.com/gautamjha2002/CI-CD_Project.git'
            }
        }
        stage('Build'){
            steps{
                sh 'mvn install'
            }
        }
        stage('Test'){
            steps{
                sh 'mvn test'
            }
        }
        stage ('CODE ANALYSIS WITH CHECKSTYLE'){
            steps{
                sh 'mvn checkstyle:checkstyle'
            }
            post{
                success{
                    echo 'Analysis Result Generated'
                }
            }
        }

        stage('Artifact to Nexus'){
            steps{
                nexusArtifactUploader(
                    nexusVersion: 'nexus3',
                    protocol: 'http',
                    nexusUrl: '35.154.9.134:8081',
                    groupId: 'QA',
                    version: "${env.BUILD_ID}-${env.BUILD_TIMESTAMP}",
                    repository: 'CI-CD-Project',
                    credentialsId: 'nexuslogin',
                    artifacts:[
                        [artifactId: 'EMS-APP',
                        classifier: '',
                        file: 'target/my-ems-project-1.0-SNAPSHOT.jar',
                        type: 'jar']
                    ]
                )
            }
        }
        stage('Building Docker Image'){
            steps{
                sh 'docker build -t ${DOCKER_USER}/${JOB_NAME}:0.${BUILD_ID} .'
            }
        }
        stage('Push to DockerHub'){
            steps{
                timeout(time:5, unit:'DAYS'){
                    input message: 'Approve Push to docker Hub'
                }
                withCredentials([string(credentialsId: 'dockerlogin', variable: 'dockerlogin')]) {
                   sh 'docker login -u gautamjha3112002 -p ${dockerlogin}'
                   sh 'docker push ${DOCKER_USER}/${JOB_NAME}:0.${BUILD_ID}'
                }
            }
        }
    }
    post{
        always{
            echo 'Slack Notification.'
            slackSend channel: '#emc-pipeline',
            color: COLOR_MAP[currentBuild.currentResult],
            message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
        }
    }
}
