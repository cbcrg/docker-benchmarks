echo true

process ver { 
  '''
  t_coffee -version; 
  blastp -version; 
  exonerate --version || true; 
  echo $PATH;  
  env | grep COFFEE
  '''
}
