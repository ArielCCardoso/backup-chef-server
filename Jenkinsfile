pipeline {
	agent { label "kubectl" }
	stages {
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
