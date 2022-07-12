# Z-stack Image Sharpening Algorithm

---

## **Contact Information**

For further details on the algorithm please contact Harriet Bishop.\
Email: 2313601b@student.gla.ac.uk (Before Jun 2022) / hattiebishop2@gmail.com (After Jun 2022)\
LinkedIn: www.linkedin.com/in/harrietbishop

---

## **Contents**

Provided is a jupyter notebook (.ipynb) file containing an algorithm which sharpens z-stack images as well as the sample data used to test and build the algorithm. 

**The Algorithm:** The algorithm takes each image and sharpens it using various low pass filters. It then selects the optimal image by comparing the peaks in the pixel intensity produced when plotting a line across a prominent feature in the image.  It compares the full width half maximum of the images sharpened by each filter and finds the narrowest (and thus sharpest) one. The algorithm returns the optimized n value which relates to the most suitable low pass filter, of the form np.ones((n,n),np.float32)/(n^2) as well as the images sharpened using this filter. 

**Sample Data:** The sample data provided is a set of z-stack images of an Onion Epidermis slide, taken using the 3D printed OpenFlexure Microscope. The images depict different layers of the onion sample, with 200nm between each plane in the z-direction. The first half of the images (0-48) have been removed due to significant drift in the x-y axis. The starting image, Image 49, is the sharpest image in the stack having been taken at the focal point. The following images are increasingly blurred. Passing this dataset through the algorithm should return an n value of 5 along with a before and after of each image. 

---

## **Motivation**

Z-stack images are taken by adjusting the distance between the sample and the collection optics to focus on different layers of the image. As the sample is moved away from the focal plane, the image becomes increasingly blurred due to out of focus light reaching the collection optics. This algorithm provides a solution to partially restore these blurred images by removing low-frequency regions in the image, extracted using a low pass filter. Different sized filters are appropriate for different images, and this algorithm aims to find and apply the most appropriate filter given a set of images. 


---

## **User Inputs**

The algorithm must be provided with the below listed inputs. 

**directory:** The path to the folder with which the images are located.\
For example: *directory = '/Users/harrietbishop/My Project/Images/OnionEpidermis'*

**x1,y1,x2,y2:** The pixel coordinates plotting a line from A(x1,y1) to B(x2,y2). For best results, the line should be plotted perpendicular to a feature in the image to obtain a clear peak in intensity for analysis. Be aware that the values of y will be reversed as they correspond to the row, which has increasing values as you move more more towards the bottom of the image. It would be wise to plot the z-stack images (using plt.imshow) without removing the axis before choosing these values to help to determine appropriate coordinates. In addition to this, it's important to check that no significant drift has occured in the x-y plane, the plotted line must always cross over the same feature. If drift or sudden displacement has occurred during the stack, temporarily remove these images from the folder before passing through the algorithm. Once an n value is found, the full dataset can then be sharpened again using an optimal nxn low pass filter. \
The coordinates used for the Onion Epidermis dataset are: *x1 = 2447, y1 = 0, x2 = 1000, y2 = 2200*







```python

```
