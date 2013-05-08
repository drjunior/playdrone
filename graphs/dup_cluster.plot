set terminal pdf dashed size 10,2.5
set output "dup_cluster.pdf"

#set title "Cluster Size repartition, Different Blacklist Cutoffs\n(min_count = 3, threshold = 0.8)"
set key invert

set ylabel "Number of Clusters" offset +1, 0
set xlabel "Cluster Size (excluding victim application)" offset 0,+0.2
set grid y

set logscale xy

set xrange[0.8:]
set yrange[0.5:]

set label "300" at 260, 0.225
set label "3000" at 2700, 0.225

plot 'dup_cluster.dat' using ($1-0.15):5 lt 1 lc 1 lw 3 with impulses t "Cutoff 3000", \
                    '' using ($1-0.05):4 lt 1 lc 2 lw 3 with impulses t "Cutoff 1000", \
                    '' using ($1+0.05):3 lt 1 lc 3 lw 3 with impulses t "Cutoff 300", \
                    '' using ($1+0.15):2 lt 1 lc 4 lw 3 with impulses t "Cutoff 100"
