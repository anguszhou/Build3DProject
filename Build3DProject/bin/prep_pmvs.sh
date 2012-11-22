# Script for preparing images and calibration data 
#   for Yasutaka Furukawa's PMVS system

# Apply radial undistortion to the images
RadialUndistort D:\Build3DProject\list.txt D:\Build3DProject\bundle\bundle.out

# Create directory structure
mkdir -p pmvs/
mkdir -p pmvs/txt/
mkdir -p pmvs/visualize/
mkdir -p pmvs/models/

# Copy and rename files
cp D:\Build3DProject\examples\ET\et000.rd.jpg pmvs/visualize/0000.jpg
mv 0000.txt pmvs/txt/
cp D:\Build3DProject\examples\ET\et002.rd.jpg pmvs/visualize/0001.jpg
mv 0001.txt pmvs/txt/
cp D:\Build3DProject\examples\ET\et003.rd.jpg pmvs/visualize/0002.jpg
mv 0002.txt pmvs/txt/
cp D:\Build3DProject\examples\ET\et004.rd.jpg pmvs/visualize/0003.jpg
mv 0003.txt pmvs/txt/
cp D:\Build3DProject\examples\ET\et005.rd.jpg pmvs/visualize/0004.jpg
mv 0004.txt pmvs/txt/
cp D:\Build3DProject\examples\ET\et006.rd.jpg pmvs/visualize/0005.jpg
mv 0005.txt pmvs/txt/
cp D:\Build3DProject\examples\ET\et007.rd.jpg pmvs/visualize/0006.jpg
mv 0006.txt pmvs/txt/
cp D:\Build3DProject\examples\ET\et008.rd.jpg pmvs/visualize/0007.jpg
mv 0007.txt pmvs/txt/

# Sample commands for running pmvs:
#   affine 8 pmvs/ 4
#   match 8 pmvs/ 2 0 0 1 0.7 5
