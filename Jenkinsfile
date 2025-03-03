pipeline {
    agent any  

    environment {
        PATH = "/usr/local/bin:$PATH"
        IOS_DEVICE = "iPhone 14 Pro"
        SCHEME = "XCTestApp"
        WORKSPACE = "XCTestApp.xcworkspace"
        LANG = "en_US.UTF-8"
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
                cd XCTestApp  # Go inside the project folder (not xcworkspace)
                export LANG=en_US.UTF-8
                export PATH=/usr/local/bin:$PATH
                pod install
                '''
            }
        }

        stage('Build & Test') {
            steps {
                sh '''
                cd XCTestApp  # Ensure we're in the correct directory
                if [ ! -f "$WORKSPACE" ]; then
                    echo "Error: $WORKSPACE does not exist!"
                    exit 1
                fi
                xcodebuild test -workspace $WORKSPACE -scheme $SCHEME \
                -destination "platform=iOS Simulator,name=$IOS_DEVICE" \
                -enableCodeCoverage YES
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying to production..."
            }
        }
    }
}
