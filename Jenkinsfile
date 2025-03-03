pipeline {
    agent any  // Runs on any available Jenkins agent

    environment {
        PATH = "/usr/local/bin:$PATH"
        IOS_DEVICE = "iPhone 14 Pro"
        SCHEME = "XCTestApp"
        WORKSPACE = "XCTestApp.xcworkspace"
        LANG = "en_US.UTF-8"  // Ensure UTF-8 Encoding
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/navyavohra/XCTestApp.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                export LANG=en_US.UTF-8
                export PATH=/usr/local/bin:$PATH
                pod install
                '''
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
