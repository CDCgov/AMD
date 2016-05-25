#!/bin/bash -l

#############################################################################
#Author: Christina Castro
#Date: March 31, 2016
#Affiliation: Centers for Disease Control and Prevention
#			  Division of Viral Diseases
#			  Advanced Molecular Detection
#############################################################################

#USAGE: qsub U50_SUBMISSION_SCRIPT.sh <reference.fasta> <contigs.fasta>

#$ -o Assembly_Stats.out
#$ -e Assembly_Stats.err
#$ -N Assembly_Stats
#$ -cwd
#$ -q all.q


#Load the modules
module load BEDTools/2.17.0
module load bowtie2/2.2.4
module load MUMmer/3.23
module load Python/2.7.3
module load quast/2.3
module load samtools/1.2


Reference=${1}
Contigs=${2}

#-------------------------------- [ Calculating N50 from de novo assembly] --------------------------------#

quast.py ${Contigs} -R ${Reference} --min-contig 10 -o quast.out			#Run quast report on the contigs from de novo assembly 

#-------------------------- [ Running a reference assembly, and calculating U50] --------------------------#

bowtie2-build -f ${Reference} REF							#Build reference index

bowtie2 -x REF -f -U ${Contigs} -S out.sam					#Map contigs to reference, output sam file

samtools view -bS -o out.bam out.sam						#Convert sam to bam

bedtools bamtobed -i out.bam > out.bed						#Convert bam to bed

sortBed -i out.bed > out_sorted.bed							#Sort bed file by chromosome, then by start position in ascending order

python -W ignore U50.py ${Reference} out_sorted.bed			#Run U50


#Unload the module
module unload BEDTools/2.17.0
module unload bowtie2/2.2.4
module unload MUMmer/3.23
module unload Python/2.7.3
module unload quast/2.3
module unload samtools/1.2
