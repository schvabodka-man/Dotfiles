#!/usr/bin/env groovy
new File("/home/scvh/gdrive/gdrivekeys/").eachFile() { file ->
  def filename = file.getName()
  def gdrivemount = "gdfs -o big_writes /home/scvh/gdrive/gdrivekeys/$filename /home/scvh/gdrive/$filename".execute().text
}
