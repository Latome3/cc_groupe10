#!/bin/bash

# Fichier de sortie
output="audit_systeme.txt"

echo "====== AUDIT SYSTEME - WINDOWS 11 ======" > $output
echo "Date : $(date)" >> $output
echo "" >> $output

# Informations générales
echo "---- INFORMATIONS SYSTEME ----" >> $output
systeminfo >> $output 2>/dev/null
echo "" >> $output

# Utilisation CPU
echo "---- UTILISATION CPU ----" >> $output
wmic cpu get loadpercentage >> $output 2>/dev/null
echo "" >> $output

# RAM
echo "---- MEMOIRE (RAM) ----" >> $output
wmic OS get TotalVisibleMemorySize,FreePhysicalMemory /Value >> $output 2>/dev/null
echo "" >> $output

# Disques
echo "---- ESPACE DISQUE ----" >> $output
wmic logicaldisk get name,size,freespace >> $output 2>/dev/null
echo "" >> $output

# Processus
echo "---- PROCESSUS ACTIFS ----" >> $output
tasklist >> $output 2>/dev/null
echo "" >> $output

# Services
echo "---- SERVICES ----" >> $output
net start >> $output 2>/dev/null
echo "" >> $output

# Réseau
echo "---- INFORMATIONS RESEAU ----" >> $output
ipconfig /all >> $output 2>/dev/null
echo "" >> $output

echo "Audit terminé. Résultats enregistrés dans $output"
