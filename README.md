# **ModMicroUofG**

<p align="center">
<img src="https://github.com/AkhilKallepalli/ModMicroUofG/blob/3e0fa2eb1bd7ecd0023f7e677077f00b084c2ab3/Images/GitHub%20Repo/ModMicro_20230628%20Status.png" alt="ModMicro Status Update" width="800"/>
</p>

**Mod**ular **Micro**scopy is an ongoing project, focusing on building low-cost and accessible hardware for realising standard and complex microscopic techniques. The repository contains all the files, modifications and updates. X

<p align="center">
<img src="https://cdn-icons-png.flaticon.com/512/5578/5578703.png" alt="Work in Progress Logo" height="200"/>
</p> 

---

# **Contents**

## **Phase 1: [OpenFlexure microscope](https://openflexure.org/) and machine learning-enhanced classification** 

The research adopts the OpenFlexure Delta Stage microscope (https://openflexure.org/) that allows motorised control and maximum stability of the samples when imaging. A Raspberry Pi camera is used for imaging the samples in a transmission-based illumination setup. The imaging data collected is catalogued and organised for classification using TensorFlow. Using visual interpretation, we have created subsets from amongst the samples to experiment for the best classification results. We found that by removing similar samples, the categorical accuracy achieved was 99.9% and 99.59% for the training and testing sets. Our research shows evidence of the efficacy of open source tools and methods. Future approaches will use improved resolution images for classification and other modalities of microscopy will be realised based on the OpenFlexure microscope. TEST

**Important Links**: 
- [GitHub](https://github.com/AkhilKallepalli/ModMicroUofG/tree/260d3f88ae4605c2fc237944587647aae78d652a/Phase%201%20(Microscope%20and%20ML))
- [OPEN-BIOset Dataset](http://dx.doi.org/10.5525/gla.researchdata.1149)
- SPIE Conference Proceeding: [Modular light sources for microscopy and beyond (ModLight)](https://doi.org/10.1117/12.2599435)

---
---

## **ModLight: Modular light sources** 

Modular light (ModLight) sources can be integrated into complex systems for microscopy, medical imaging, remote sensing, and so many more. Motivated by the need for affordable and open-access alternatives that are globally relevant, we have designed and shared light devices that use simple, off-the-shelf components. Red, green, blue, white and near-infrared LEDs are combined using mirrors and X-Cube prisms in novel devices. This modular nature allows portability and mounting flexibility. The ModLight suite can be used with any optical system that requires single- or multi-wavelength illumination such as bright-field and epifluorescence microscopes.

**Important Links**: 
- [Zenodo](https://zenodo.org/record/7385903)
- HardwareX Paper: [Modular light sources for microscopy and beyond (ModLight)](https://doi.org/10.1016/j.ohx.2022.e00385)

***NOTE**: Files of the same version as on Zenodo and HardwareX paper availble through this [GitHub Folder](https://github.com/AkhilKallepalli/ModMicroUofG/tree/c88cae8ca496235c1b51023b1f2a8044d0d7d9a2/ModLight).* 

---
---

## **Phase 2: Epifluorescence Microscopy** 

In collaboration with [Dr Jonathan Taylor](https://www.gla.ac.uk/schools/physics/staff/jonathantaylor/), the research led by Mr Robert Archibald investigated comparing a modular epifluorescence microscope with a standard Nikon Ti-Eclipse microscope. The results have shown that our results match the resolution and image sharpness as compared to a proprietary microscope, that latter costing many orders of the 3D printed microscopy system. 

### ***Hardware*** 
The original [OpenFlexure microscope](https://openflexure.org/) is adopted as the template, leveraging the flexures and their stability. Our contributions include a modified version of the epifluorescence setup to enhance access to the optics, introduce modular attachments and in-house built [ModLight](https://doi.org/10.1016/j.ohx.2022.e00385) sources to increase the spectral fidelity of a single system. 

### ***Sharpening Algorithm*** 
Image prossessing techniques are an essential step in data analysis, especially so when the image quality is degraded. This paper presents an iterative sharpening algorithm designed for use on the OpenFlexure Microscope, to bring z-stack images back into focus. Three different sharpness metrics are evaluated and the data needed to process these images, and establish the highest quality after image acquisition is available [here](https://github.com/AkhilKallepalli/ModMicroUofG/tree/a79b8e51664f305bbde2d7f3cc1418ee8469735c/Phase%202%20(Epifluorescence%20Microscope)/Sharpening%20algorithm). 

**Important Links**: 
- [GitHub](https://github.com/AkhilKallepalli/ModMicroUofG/tree/260d3f88ae4605c2fc237944587647aae78d652a/Phase%202%20(Epifluorescence%20Microscope))
- Research article: **Under Preparation**

---
---

## **Phase 3: Confocal Microscopy** 

<p align="center">
<img src="https://static.wixstatic.com/media/2c9822_3c1ba3d0fdf341638be0a5224987d4bd~mv2_d_2048_2048_s_2.jpg/v1/fill/w_600,h_600,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/comingsoon.jpg" alt="Work in Progress Logo" height="200"/>
</p> 

---
---

## **Phase 4: Structured Illumination Microscopy** 

<p align="center">
<img src="https://static.wixstatic.com/media/2c9822_3c1ba3d0fdf341638be0a5224987d4bd~mv2_d_2048_2048_s_2.jpg/v1/fill/w_600,h_600,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/comingsoon.jpg" alt="Work in Progress Logo" height="200"/>
</p> 

---
---

<p align="center">
<img src="https://kallepallilab.files.wordpress.com/2021/11/photonics-logo-trans-tagline.png" alt="drawing1" height="75"/> <img src="https://kallepallilab.files.wordpress.com/2021/11/university-of-glasgow.png" alt="drawing2" height="75"/> <img src="https://kallepallilab.files.wordpress.com/2021/11/50648064147_f136084fee_o.jpeg" alt="drawing3" height="75"/> <img src="https://kallepallilab.files.wordpress.com/2021/11/iddacyxk.jpeg" alt="drawing4" height="75"/> <img src="https://kallepallilab.files.wordpress.com/2021/11/sitelogo_788779_en.jpeg" alt="drawing5" height="75"/> <img src="https://kallepallilab.files.wordpress.com/2022/07/oshw.png" alt="drawing6" height="75"/>
</p>

---
---

## *Contact Information*

*For further details, discussions and collaborations, please contact Dr Akhil Kallepalli*\
**Email**: Akhil.Kallepalli@glasgow.ac.uk

*To learn more about our research, check out the lab website*\
**Website**: https://kallepallilab.com 