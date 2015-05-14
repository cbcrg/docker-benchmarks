def file1 = new File('trace_native.txt')
def file2 = new File('trace_docker.txt')

def all = []

file1.readLines().eachWithIndex { line, index -> 
  def cols = line.tokenize('\t')
  def key = cols[3]
  def time = cols[17]

  all[index] = [ name: key.tokenize()[0], native: time ]
}

file2.readLines().eachWithIndex { line, index ->
  def cols = line.tokenize('\t')
  def key = cols[3]
  def time = cols[17]

  assert key.tokenize()[0] == all[index].name
  all[index].docker = time 
}

println "name,realtime_docker,realtime_native"

all.each { record -> println "${record.name},${record.docker},${record.native}" }