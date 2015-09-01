/* 
 * Read "plot_native.txt" and "plot_docker.txt" tab-separated files. 
 * Each rows contain the following fields
 * 
 * 1.	Task type
 * 2. 	Median task duration time 
 * 3.   Mean task duration time 
 * 4. 	Median task real execution time
 * 5. 	Mean task duration time
 * 6.   Number of tasks executed
 * 
 */
 
def file1 = new File('plot_native.txt')
def file2 = new File('plot_docker.txt')

def all = []
def index = 0

file1.readLines().each { line -> 
  def cols = line.tokenize('\t')
  def key = cols[0]		// note: index is zero based 
  def time = cols[2]	// third column: Mean task duration time	
  
  def name = key.tokenize()[0]
  if( name == 'normExonerate' || name == 'matrix' ) return 
  	
  all[index++] = [ name: name, native: time ]
}

index = 0

file2.readLines().each { line ->
  def cols = line.tokenize('\t')
  def key = cols[0]
  def time = cols[2]	// third column: Mean task duration time
  
  def name = key.tokenize()[0]
  if( name == 'normExonerate' || name == 'matrix' ) return 
  
  assert name == all[index].name
  all[index].docker = time
  index ++ 
}

println "name,realtime_docker,realtime_native"

all.each { record -> println "${record.name},${record.docker},${record.native}" }
