trace.csv 
----------

field| name		| description  
----|-----------|---------------
1. 	| task_id	| Task index	
2. 	| hash		| Unique ID	
3.  | native_id | Posix process number	
4. 	| name		| Task name
5.  | status	| Task status
6. 	| exit		| Posix exit status
7. 	| submit	| Task submit timestamp 
8. 	| duration	| Time elapsed to complete since the submission	
9.  | realtime	| Task execution time i.e. delta between completion and start timestamp (not including container instantiation)
10. | %cpu		| CPU utilization of the process expressed in percentage (cputime/realtime ratio)	
11. | rss		| Real memory usage (resident set size) 	
12. | vmem		| Virtual memory usage	
13. | peak_rss  | Peak real memory usage 	
14. | peak_vmem	| Peak virtual memory usage	
15. | rchar		| Number of bytes the process read	
16. | wchar		| Number of bytes the process wrote	
17. | syscr		| Number of read-like system call invocations that the process performed	
18. | syscw		| Number of write-like system call invocations that the process performed	
19. | duration	| Elapsed time between submission and completion in milliseconds	
20. | realtime	| Task execution time i.e. delta between completion and start timestamp in milliseconds (not including container instantiation)	
21. | rss		| Real memory usage (bytes)
22. | vmem		| Virtual memory usage (bytes)
23. | peak_rss	| Peak real memory usage (bytes)
24. | peak_vmem	| Peak virtual memory usage (bytes)
25. | rchar		| Number of bytes the process read (bytes)
26. | wchar		| Number of bytes the process wrote (bytes)


stats_native.txt / stats_docker.txt
------------------------------------

field| description  
----|---------------
1.	| Task type
2. 	| Median task duration time 
3.  | Mean task duration time 
4. 	| Median task real execution time
5. 	| Mean task duration time
6.  | Number of tasks executed

plot_native.txt / plot_docker.txt
------------------------------------

field| description  
----|---------------
1.	| Task type
2. 	| Median task duration time 
3.  | Mean task duration time 
4. 	| Median task real execution time
5. 	| Mean task duration time
6.  | Number of tasks executed


plot.csv
------------

field| description  
----|---------------
1.	| Task type
2. 	| Mean *native* task duration time 
3.  | Mean *docker* task duration time 


time_native.txt / time_docker.txt
------------------------------------

field| name		| description  
----|-----------|---
1.	| begin 	| Pipeline start timestamp  
2. 	| end 		| Pipeline completion timestamp
3.  | elapsed 	| Elapsed time (hours : mins : secs)
4. 	| delta 	| Elapsed time (milliseconds)
5.	| duration 	| Sum of all tasks duration time (milliseconds)
6.	| realtime	| Sum of all tasks execution time (milliseconds)






