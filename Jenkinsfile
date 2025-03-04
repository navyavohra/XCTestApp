pipeline {
    agent any  

    environment {
        PATH = "/usr/local/bin:$PATH"
        IOS_DEVICE = "iPhone 16 Pro"
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
                cd $WORKSPACE
                export LANG=en_US.UTF-8
                export PATH=/usr/local/bin:$PATH
                echo "🛠️ Installing CocoaPods dependencies..."
                rm -rf Pods Podfile.lock
                sudo -u navyavohra pod install --repo-update
                echo "✅ CocoaPods dependencies installed successfully!"
                '''
            }
        }

        stage('Verify .xcworkspace') {
            steps {
                sh '''
                echo "🔍 Checking if .xcworkspace was generated..."
                if [ ! -d "$WORKSPACE" ]; then
                    echo "❌ Error: $WORKSPACE does not exist!"
                    exit 1
                fi
                echo "✅ $WORKSPACE exists!"
                '''
            }
        }

        stage('Build & Test') {
            steps {
                sh '''
                xcodebuild test 
		-workspace XCTestApp.xcworkspace 
		-scheme XCTestApp 
		-destination 'platform=iOS Simulator,name=iPhone 16 Pro,OS=latest'
                -enableCodeCoverage YES
		-allowProvisioningUpdates
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
        failure {
            echo "❌ Build failed! Check the logs for more details."
        }
    }
}
