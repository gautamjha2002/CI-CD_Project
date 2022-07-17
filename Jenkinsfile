def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
]
pipeline{
    agent any
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
                    nexusUrl: '15.207.113.130:8081',
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
    }
    post{
        always{
            echo 'Slack Notification.'
            slackSend channel: '#emc-pipeline'
            color: COLOR_MAP[currentBuild.currentResult],
            message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
        }
    }
}
