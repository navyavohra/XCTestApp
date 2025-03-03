pipeline {
    agent any  // Runs on any available Jenkins agent

    environment {
        IOS_DEVICE = "iPhone 14 Pro"
        SCHEME = "XCTestApp"
        WORKSPACE = "XCTestApp.xcworkspace"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/navyavohra/XCTestApp.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pod install'  // Install CocoaPods dependencies (if applicable)
            }
        }

        stage('Build & Test') {
            steps {
                sh '''
                xcodebuild test -workspace $WORKSPACE -scheme $SCHEME \
                -destination "platform=iOS Simulator,name=$IOS_DEVICE" \
                -enableCodeCoverage YES
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying to production..."
                // Add deployment commands here
            }
        }
    }
}
