# Script for preparing images and calibration data 
#   for Yasutaka Furukawa's PMVS system

# Apply radial undistortion to the images
RadialUndistort e:\Build3DProject\list.txt  e:\Build3DProject\bundle\bundle.out 

# Create directory structure
mkdir -p pmvs/
mkdir -p pmvs/txt/
mkdir -p pmvs/visualize/
mkdir -p pmvs/models/

# Copy and rename files
cp E:\Build3DProject\examples\West1Side\0000.rd.jpg pmvs/visualize/0000.jpg
mv 0000.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0001.rd.jpg pmvs/visualize/0001.jpg
mv 0001.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0002.rd.jpg pmvs/visualize/0002.jpg
mv 0002.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0003.rd.jpg pmvs/visualize/0003.jpg
mv 0003.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0004.rd.jpg pmvs/visualize/0004.jpg
mv 0004.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0005.rd.jpg pmvs/visualize/0005.jpg
mv 0005.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0006.rd.jpg pmvs/visualize/0006.jpg
mv 0006.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0007.rd.jpg pmvs/visualize/0007.jpg
mv 0007.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0008.rd.jpg pmvs/visualize/0008.jpg
mv 0008.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0009.rd.jpg pmvs/visualize/0009.jpg
mv 0009.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0011.rd.jpg pmvs/visualize/0010.jpg
mv 0010.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0013.rd.jpg pmvs/visualize/0011.jpg
mv 0011.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0014.rd.jpg pmvs/visualize/0012.jpg
mv 0012.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0015.rd.jpg pmvs/visualize/0013.jpg
mv 0013.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0016.rd.jpg pmvs/visualize/0014.jpg
mv 0014.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0017.rd.jpg pmvs/visualize/0015.jpg
mv 0015.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0018.rd.jpg pmvs/visualize/0016.jpg
mv 0016.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0019.rd.jpg pmvs/visualize/0017.jpg
mv 0017.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0020.rd.jpg pmvs/visualize/0018.jpg
mv 0018.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0021.rd.jpg pmvs/visualize/0019.jpg
mv 0019.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0022.rd.jpg pmvs/visualize/0020.jpg
mv 0020.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0023.rd.jpg pmvs/visualize/0021.jpg
mv 0021.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0024.rd.jpg pmvs/visualize/0022.jpg
mv 0022.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0025.rd.jpg pmvs/visualize/0023.jpg
mv 0023.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0026.rd.jpg pmvs/visualize/0024.jpg
mv 0024.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0027.rd.jpg pmvs/visualize/0025.jpg
mv 0025.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0029.rd.jpg pmvs/visualize/0026.jpg
mv 0026.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0030.rd.jpg pmvs/visualize/0027.jpg
mv 0027.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0031.rd.jpg pmvs/visualize/0028.jpg
mv 0028.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0032.rd.jpg pmvs/visualize/0029.jpg
mv 0029.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0033.rd.jpg pmvs/visualize/0030.jpg
mv 0030.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0034.rd.jpg pmvs/visualize/0031.jpg
mv 0031.txt pmvs/txt/
cp E:\Build3DProject\examples\West1Side\0035.rd.jpg pmvs/visualize/0032.jpg
mv 0032.txt pmvs/txt/

# Sample commands for running pmvs:
#   affine 33 pmvs/ 4
#   match 33 pmvs/ 2 0 0 1 0.7 5
