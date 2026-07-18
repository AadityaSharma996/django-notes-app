@Library ("shared") _
pipeline {
    agent { label "adi" }
    
    stages{
        stage ("Hello"){
            steps {
                script{
                    hello()
                }
            }
        }
        stage ("Code"){
            steps {
                script{
                  cloning("https://github.com/AadityaSharma996/django-notes-app.git","main")   
                }
            }
        }
        stage ("Build"){
            steps {
                script{
                build("notes-app","latest","aadityasharma96")
                }
            }
        }
        stage ("Push to Docker HUb"){
            steps{
                script{
                    push("notes-app","latest","aadityasharma96")
                }
            }
        }
        stage ("Deploy"){
            steps {
                echo "This is deploying the code"
                sh "docker compose down && docker compose up -d"
            }
        }
    }
}
