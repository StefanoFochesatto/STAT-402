TwoStageClusterSample <- function(N,M,y){
  ## This function takes a Total number of first stage clusters N(number of bookcases), 
  ## Population total inside the sampled second stage cluster M(Booktotal inside sampled bookcases), 
  ## and the second stage sample y, as a dataframe with books as rows and columns as cluster. 
  
  ## Extracting number of samples n
  n = length(y) 
  ## Computing yHats for each sample
  yHats = colMeans(y, na.rm = TRUE);
  ## Computing the Tau estimater
  TauHat = N*sum(M*yHats)/n;
  ## Computing the variance for each sample
  s_squared = diag(var(y,  na.rm = TRUE))
  ## Pulling number of samples taken, at each bookcase. 
  m = colSums(!is.na(y))
  ## Computing the MSE
  MSE = sum((M*yHats - (TauHat/N))^2) / (n-1); 
  
  ## Computing The variance
  Cluster2ClusterVar = ((N-n)/N)*(N^2)*(MSE/n)
  InsideClusterVar = (1/(n*N))*(N^2)*sum(M^2*((M - m)/M)*(s_squared/m))
  TotalVar = Cluster2ClusterVar + InsideClusterVar
  
  # Returning the results as a list. 
  RList <- list('That' = TauHat, 's_squared' = TotalVar)
  return(RList)
}