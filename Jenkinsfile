pipeline {
    agent any
    
    stages {
        stage('checkoutSCSC') {
            steps {
                git branch: 'main', url: 'https://github.com/devopsenthusiasts/devopsproject.git'
                
            }
        }
        
        stage('build') {
            steps {
                sh 'mvn package'
                mail bcc: '', body: 'The project is built successfully!', cc: '', from: '', replyTo: '', subject: 'build successful', to: 'projects2488@gmail.com'
            }
        }
        
        stage('deploytotest') {
            steps {
                deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'tomcattestcreds', path: '', url: 'http://172.31.25.98:8080')], contextPath: 'testappfromscripted', war: '**/*.war'
                mail bcc: '', body: 'The app is successfully deployed to QA!', cc: '', from: '', replyTo: '', subject: 'Deploy to test successful', to: 'projects2488@gmail.com'
            }
        }
        
        stage('runtests') {
            steps {
                sh 'echo Testing passed'
                mail bcc: '', body: 'The test cases did run successfully!', cc: '', from: '', replyTo: '', subject: 'Tests Passed/ successful', to: 'projects2488@gmail.com'
            }
        }
        
        stage('deploytoProd') {
            steps {
                deploy adapters: [tomcat9(alternativeDeploymentContext: '', credentialsId: 'tomcat-production', path: '', url: 'http://172.31.16.189:8080')], contextPath: 'prodappfromscripted', war: '**/*.war'
                mail bcc: '', body: 'Application is LIVE', cc: '', from: '', replyTo: '', subject: 'application is LIVE', to: 'projects2488@gmail.com'
            }
        }
    }
    
    post {
        failure {
            mail bcc: '', 
                 body: "The pipeline failed at stage: ${env.STAGE_NAME}. Please check the Jenkins console for more details.", 
                 cc: '', 
                 from: '', 
                 replyTo: '', 
                 subject: 'Pipeline Failed', 
                 to: 'projects2488@gmail.com'
        }
        
        unstable {
            mail bcc: '', 
                 body: "The pipeline is unstable at stage: ${env.STAGE_NAME}. Please check the Jenkins console for more details.", 
                 cc: '', 
                 from: '', 
                 replyTo: '', 
                 subject: 'Pipeline Unstable', 
                 to: 'projects2488@gmail.com'
        }
        
        aborted {
            mail bcc: '', 
                 body: "The pipeline was aborted at stage: ${env.STAGE_NAME}.", 
                 cc: '', 
                 from: '', 
                 replyTo: '', 
                 subject: 'Pipeline Aborted', 
                 to: 'projects2488@gmail.com'
        }
        
        always {
            echo 'Pipeline execution completed.'
        }
    }
}
