
fitness<-read.csv("fitness.csv")

lmBoot <- function(inputData, nBoot){
    
    # Create variable called input data
    
    nrowdata<-nrow(inputData)
    
    # Create a list for compiling Bootstraps
    bootList<-list()
      
    # Create a for loop to run multiple bootstraps
    
    for(i in 1:nBoot){
      
      # Create a Sample Index
      sampleIndex <- sample(1:nrowdata, nrowdata, replace = T)
      
      # Sample the dataset
      bootData<- inputData[sampleIndex,]
      
      bootList[[i]]<-bootData
      
    }
    
    ourBootReg<- lapply(bootList,function(itemFromList){coef(lm(inputData[,1]~inputData[,2],data=itemFromList))})
    
    dataframeOfBootCoefs<-plyr::ldply(ourBootReg)
    
    names(dataframeOfBootCoefs)<-c("intercept","slope")
    
    apply(dataframeOfBootCoefs,2,quantile,probs=c(0.025,0.975))
    
}



