# **A GUI for the synthesis and design of analog filters based on Pascal and other classical approximations**
Manuscript ID: **IEEE Latin America Transactions** Submission **ID: 10184**<br>
**Authors:**<br>
Víctor Hugo Hernández Juárez<sup>1</sup><br>
Luis Abraham Sánchez Gaspariano<sup>1</sup><br>
Carlos Sánchez López<sup>2</sup><br>
Richard Torrealba Meléndez<sup>1</sup><br>
Jesús Manuel Muñoz Pacheco<sup>1</sup><br>
Carlos Muñiz Montero<sup>3</sup><br>
Luz del Carmen Gómez Pavón<sup>1</sup><br>

**Affiliation:**<br>
1. Benemérita Universidad Autónoma de Puebla. Facultad de Ciencias de la Electrónica, Av. San Claudio y 18 Sur Edif. FCE1, Col. San Manuel, Ciudad Universitaria, Puebla, México.<br>
2. Departamento de Electrónica, Universidad Autónoma de Tlaxcala, Calzada Apizaquito S/N, km 1.5, Apizaco, Tlaxcala, México.<br>
3. Universidad Politécnica de Puebla, Ingeniería en Electrónica y Telecomunicaciones, Tercer Carril del Ejido, Serrano S/N, Juan C. Bonilla, Puebla, México.<br>

This repository contains all scripts required to reproduce the simulation and numerical results presented in the article.

### **Software Requirements**

This software only requires a basic Matlab setup with Symbolic Math Toolbox included. To design filters with classical approximation methods, the software requires the toolbox which is located in the Functions_of_classical_methods/AF_TOOLBOX_2016 folder. The toolbox supporting the book: Lars Wanhammar: Analog Filters Using MATLAB, Springer, 2009.

### **Installation:**

The software does not need any installation. It is sufficient to add the folders with subfolders to the Matlab path.
**Folder organization and start guide is included in SAFIMAM Documentation file in documentation folder.**

### **Folder Organization**

The software is organized in several folders. The src folder includes fig and m files for the SAFIMAM interface, in these files are contained all the interface windows that have the functions of determining the low-pass filter order, the low-pass filter transfer functions, the low pass frequency responses, the low-pass electrical networks, and the low-pass filter transformations to other response types. The Pascal_Functions folder contains the functions used to determine the order of the Pascal filters, the transfer functions for the responses with optimization in the pass band and optimization in the stop band, and also includes the function that performs the synthesis to determine the values of the passive electrical networks of the filters, as well as the functions that complement it. The Bessel_Functions folder contains the functions to determine the denominator polynomials of the Bessel functions that are used with the function included in the same folder to perform the synthesis of their electrical networks and determine the values of their elements. The folder Functions_of_classical_metods contains the toolbox AF_TOOLBOX_2016 supporting the book Lars Wanhammar: Analog Filters Using MATLAB, Springer, 2009, which contains the functions to perform the synthesis of the transfer functions of the classical approximation methods. Finally, in the Electrical_Network folder are stored the images of the different passive electrical networks of the filters, low pass, high pass, band pass and band reject, in the T-type and π-type network configurations, these networks are the ones projected in the interface when determining the electrical networks of the filters, with the objective of visualizing the generated electrical network. In the documentation folder there is a small user manual on how the interface works, and also two files that document the design process of the filters reported in the article, both for the EMG filter and for the 5G filter.<br>

To reproduce the graphs of Figure 4, in the Figure_4 folder are contained the Matlab codes that must be compiled to generate the scalability graphs of each approximation method, for this purpose the functions named analizar_* must be executed, it is worth mentioning that all the folders of the repository must be added to the path.<br>

Similarly, to reproduce the runtime results for the classical and Pascal methods, the function medir_runtime_clasicos_pascal_completo_ultim is executed, and for the case of Bessel, the function runt_bessel.<br>

Note: These results will vary depending on the characteristics of the computer equipment, in this case the tests were carried out on a Lenovo Laptop with 13th Gen Intel(R) Core(TM) i7-1355U processor (1.70 GHz), Intel(R) Iris(R) Xe Graphics graphics card (128 MB), 64-bit operating system, and x64-based processor.<br>

To reproduce Figure 11 from the Figure_11 folder, simply execute the file KS_EMG_5G.m, and for Figure 6 from the Figure_6 folder, execute ANMC_EMG_GEN.m.<br>

### **Star GUI**
Once the folders contained in the repository have been added to the Matlab path, simply execute the word “orden” in the Matlab command window to open the SAFIMAM interface start window.
<img width="1638" height="872" alt="Diagrama sin título-Página-6" src="https://github.com/user-attachments/assets/b5ac0e35-9656-4f50-b5a0-ea1132540a01" />

### **Authors:**

**Víctor Hugo Hernández Juárez** received the MSc and the BSc degree, both in Electronics, from the Benemérita Universidad Autónoma de Puebla (BUAP), and Instituto Politécnico Nacional, respectively. His research interests include both analog and digital signal processing, coding, radio communications systems and networks design. Currently, he is pursuing the PhD degree from BUAP, his research topic focuses on the synthesis and design of analog filters for biomedical applications.
Email: hj224570062@alm.buap.mx (corresponding author)

**Luis Abraham Sánchez Gaspariano** received the PhD degree in Electronics from INAOE, Puebla, México, in 2011. During 2009 he was a visiting scholar in the Integrated Circuits Design (ICD) group at the University of Twente, in the Netherlands. He is currently with the Electronics Faculty at Benemérita Universidad Autónoma de Puebla (BUAP), in Puebla, México, as a full professor. His research interests include the development of Electronic Design Automation (EDA) tools and the development of electronic automotive systems.
Email: luis.sanchezgas@correo.buap.mx

**Carlos Sánchez López** received his Ph.D. degree in Electronics from INAOE, México in 2006. Since January 2006, he is with the Universidad Autónoma de Tlaxcala (UAT) in Apizaco, México, as an Associate Professor and Researcher. Dr. Sánchez-López is the author and coauthor of book chapters, research journal papers, and international conference proceedings in the fields of modeling and simulation of linear and nonlinear circuits and systems, chaotic oscillators, symbolic analysis, mixed-signal circuits, RF circuits, and computer-aided circuit design.
Email: csanchezl@uatx.mx

**Richard Torrealba Meléndez** received the Ph.D degree from INAOE, México in 2014. He is currently a full Professor-Researcher with the Electronics Faculty at the Benemérita Universidad Autónoma de Puebla. Dr. Torrealba is a regular member of the Sistema Nacional de Investigadores (SNI) de México, a top level program of the government of México. His research interests include: antenna design, Wireless personal communications, dielectric spectroscopy at microwave frequencies and telecommunications.
Email: richard.torrealba@correo.buap.mx

**Jesús Manuel Muñoz Pacheco** is a tenured professor in the Electronics Faculty at Benemérita Universidad Autónoma de Puebla, México. Dr. Munoz-Pacheco founded and leads the research group: Fractional-order Systems and Nonlinear Circuits. He has published about 120 scientific works related to chaotic systems and fractional-order calculus. Dr. Munoz-Pacheco is Associate Editor for Frontiers in Physics, IJNM-Wiley, Frontiers in Applied Mathematics and Statistics, Chaos Theory and Applications, etc.
Email: jesusm.pacheco@correo.buap.mx

**Carlos Muñiz Montero** received his Ph.D. degree in Electronics from INAOE, México, in 2008. He has authored and co-authored several books, book chapters, journal articles, and conference papers. Since 2012, he has been an Associate Professor in the Department of Electronics and Telecommunications Engineering at Universidad Politécnica de Puebla (UPPue), where he has led the Electronics Group since 2017. His research interests include analog, mixed-signal, RF electronics, control systems, and fractional-order systems.
Email: carlos.muniz@uppuebla.edu.mx

**Luz del Carmen Gómez Pavón** received the Ph.D. degree from the Benemérita Universidad Autónoma de Puebla, México, in 2001. She is a regular member (level-2) of the National System for Researchers, from México. Her research interests include optical fiber-based lasers systems, specially integration of nanotechnology in optical laser sources. Instrumentation of photonic devices, and their related applications.
Email: luz.gomez@correo.buap.mx
