//  jte { pipeline_template = 'custom.Jenkinsfile'  }

libraries {
    v1_maven {
        anotherImages = [ 'maven:3-amazoncorretto-8', 'maven:ibmjava']
    }
} 




