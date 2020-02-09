pipeline {
	agent { label "kubectl" }
	stages {
		stage ("Checkout") {
			steps {
			    container("kubectl"){
				    dir(WORKSPACE){
					    checkout scm
				    }
			      }
			}
		}
		stage ("Compilação") {
			steps {
			    container("kubectl"){
				    dir(WORKSPACE){
					    sh'''
					      export
					      hostname
					      id
					      ls -ltr
					     sleep 10000
					   '''
				    }
			      }
			}
		}
	}
}
