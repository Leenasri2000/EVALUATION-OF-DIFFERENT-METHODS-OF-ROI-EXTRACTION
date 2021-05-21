# EVALUATION-OF-DIFFERENT-METHODS-OF-ROI-EXTRACTION
# Here the evaluation of different methods of region of interet extraction for mammogram images is done and the overlap ratio, SSIM, and dice similarity indx are found outh with respect to ground truth. 
# The database used here is MINI-DDSM database from kaggle. 
# The methods that are evealated here is WATERSHED TRANSFORM, K-MEANS CLUSTERING, EDGE DETECTING METHOD(SOBEL OPERAATOR) AND MORPHOLOGICAL OPERATIONS(DILATION AND EROSION)
# The reason for using these methods is the breast cancer rate in women was increasing very rapidly, so that there is a need for effective and faster diagnosis. The above mentioned methods are fast and simple. So after evaluation is done another method that is used to increase its efficiency is introduced.
# .m represents the matlab file
# CANCERDB.rar is the database used
# preprocess.m is the preprocessing of the mammogram images in the database
# watershed.m is the watershed transform of the preprocessed image
# kmeans.m is the k-means clustering for the preprocessed image
# sobelope.m is the edge detecting metho(i.e., sobel operator) for the preprocessed image
# dilation.m is the dilation and erosion method for the preprocessed image
# superimpose.m is the superimposeing of extracted roi for different methods and the given mask(i.e., ground truth)
# overlap.m is to find the overlap ratio used to find the ratio of overlapping between the extracted roi bounding box value and the ground truth bounding box value
# SSIM.m is used to find the structural similarity index of the extraced roi and the ground truth roi
# Diceindex.m is used to find the dice similarity index betweedn the extracted roi and the ground truth
# Here the overlap ratio, dice index and the SSIM have the values from 0 to 1. If it is zero it is not overlapped and not structyrally similar. If it is one they are completely overlapped and structurally similar. 
# morphological_multiplethresh.m is the morphological operation integrated with multiple thresholding. 
# As morphological operation has the high efficiency, in order to improve that we have integrated themorphological operations with multiple threholding so that the efficiency increases.
