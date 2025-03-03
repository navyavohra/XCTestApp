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
                cd XCTestApp  # Ensure we are in the correct project folder
                export LANG=en_US.UTF-8
                export PATH=/usr/local/bin:$PATH
                
                echo "🛠️ Installing CocoaPods dependencies..."
                rm -rf Pods Podfile.lock  # Remove existing pods to ensure a clean install
                pod install --repo-update
                
                echo "✅ CocoaPods dependencies installed successfully!"
                '''
            }
        }

        stage('Verify .xcworkspace') {
            steps {
                sh '''
                cd XCTestApp  # Ensure we are in the project directory
                
                echo "🔍 Checking if .xcworkspace was generated..."
                if [ ! -d "XCTestApp.xcworkspace" ]; then
                    echo "❌ Error: XCTestApp.xcworkspace does not exist!"
                    ls -la  # Show current files for debugging
                    exit 1
                fi
                
                echo "✅ .xcworkspace file exists, proceeding with the build..."
                '''
            }
        }

        stage('Build & Test') {
            steps {
                sh '''
                cd XCTestApp  # Ensure we are in the correct project directory
                
                echo "🚀 Running Xcode build & test..."
                xcodebuild test -workspace $WORKSPACE -scheme $SCHEME \
                -destination "platform=iOS Simulator,name=$IOS_DEVICE" \
                -enableCodeCoverage YES | xcpretty && exit ${PIPESTATUS[0]}
                '''
            }
        }

        stage('Deploy') {
            steps {
                echo "🚀 Deploying to production..."
            }
        }
    }

    post {
        always {
            echo "📝 Build process completed!"
        }
        success {
            echo "✅ Build & Tests passed successfully!"
        }
        failure {
            echo "❌ Build failed! Check the logs for more details."
        }
    }
}
