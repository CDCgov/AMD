U50: a new metric for measuring assembly performance output based on non-overlapping, target-specific contigs

I. Summary
II. Usage
III. License
IV. Citation
V. Contact

*** ATTENTION: All output files are given in the form of a zero-based counting system! ***

--------------------------------------------------
I. SUMMARY
--------------------------------------------------

Next generation sequencing (NGS) is used for thousands of microbial and viral studies annually, and one of the most common ways to analyze these data is by de novo assembly. Traditionally, the overall assembly performance was commonly measured by a metric called the N50 value; however, the N50 metric has several major setbacks that can often produce inaccurate results. We developed a new metric called U50, which identifies unique, target-specific contigs using a reference sequence as baseline, aiming to circumvent some limitations inherent to the N50 metric.


--------------------------------------------------
IIA. USAGE - Python Script (U50.py)
--------------------------------------------------

U50 takes a FASTA reference genome file and a sorted BED file of the contigs as input.

TERMINAL WINDOW: $ python U50.py <reference.fasta> <contigs_sorted.bed>

--------------------------------------------------
IIB. USAGE - Shell Script (U50 Pipeline)  
--------------------------------------------------

If you have Bowtie2, SAMtools, BEDTools, MUMmer, and QUAST installed with the file location added to the computer path (See Edit_PATH.docx), then you can run the submission shell script with simply two input files: (1)the FASTA reference genome file and (2)the FASTA contig file.

Below are examples of how to run the submission script from a typical terminal window, or from a cluster or centralized server.

TERMINAL WINDOW: $ sh U50_Terminal_SUBMISSION_SCRIPT.sh <reference.fasta> <contigs.fasta>

CLUSTER: $ qsub U50_Cluster_SUBMISSION_SCRIPT.sh <reference.fasta> <contigs.fasta>
(Just edit (1) the specific job information at the top and (2) the modules to match the correct version you have installed)


First, the submission script will run QUAST on the input contigs to generate the N50, L50, NG50, etc. statistics. Second, a reference mapping is performed using Bowtie2.
Third, file conversion is performed. (1) SAM -> BAM (2) BAM -> BED (3) BED -> Sorted BED
Fourth, the U50 program is executed. 

The output contains four files in total: 
(1)AssemblyStatistics.txt - shows the standard output that prints to the terminal screen (U50, UG50, UG50%, etc.)
(2)contigs.txt - shows the contig coordinates and a count of the unique base positions that a particular contig covers
(3)gaps.txt - shows the index position of any gaps in coverage
(4)overlaps.txt. - shows the index position of an overlap and which contig that overlap belongs to.


--------------------------------------------------
III. LICENSE
--------------------------------------------------

The project utilizes code licensed under the terms of the Apache Software License and therefore is licensed under ASL v2 or later. 
This program is free software: you can redistribute it and/or modify it under the terms of the Apache Software License version 2, or (at your option) any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY, without even the implied warranty of MERCHANTIBILITY or FITNESS FOR A PARTICULAR PURPOSE. See the Apace Software License for more details.
You should have received a copy of the Apache Software License along with this program. If not, see http://www.apache.org/licenses/LICENSE-2.0.html.


--------------------------------------------------
IV. CITATION
--------------------------------------------------

Please cite the following article:

[PAPER]


--------------------------------------------------
V. CONTACT
--------------------------------------------------

Terry Fei Fan Ng
Division of Viral Diseases
Centers for Disease Control and Prevention
1600 Clifton Rd. NE, Mailstop G-10
Atlanta, GA 30329

Email: ylz9@cdc.gov
Project website: https://github.com/CDCgov/U50
