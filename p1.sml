(*
 Program 1: Functions as Parameters
 CS 3363 Spring 2024
 Richard Churchill
 Due: 2-3-2024
 Submitted: 1-31-2024
 Jordan Paul, jopaul
 
 myinsert - recursive insertion function
		*sorted list in correct order of comparator
		*value to insert
		*comparator Functions
		*discriminator: remove or keep duplicates
		
 myinsort - recursive insertion sort using myinsert
		*unsorted list to sort
		*comparator function
		*discriminator: remove or keep duplicates
		
 nd       - always false comparator function
 
comparators: op<, op<=, op>, op>=
		    (< ascending, > descending)
			
discriminator:  op= removes duplicates
			    nd all values retained
				   
*)

(* always false functions *)
fun nd(_:int, _:int) = false;

(* insertion function *)
fun myinsert([], x, Fn, Desc) = [x]
|   myinsert(h::T, x, Fn, Desc) = 
	if Desc(h, x)
	then h :: T
	else if Fn(x, h)
		 then x :: h :: T
		 else h :: myinsert(T, x, Fn, Desc);

(* insertion sort function *)
fun myinsort([], Fn, Desc) = []
|	myinsort(h::T, Fn, Desc) =
	myinsert(myinsort(T, Fn, Desc), h, Fn, Desc);

(* test cases *)
val _ = print("myinsert test\n");

myinsert([0, 1, 2, 3, 5], 3, op<=, nd);
myinsert([0, 1, 2, 3, 5], 3, op<=, op=);
myinsert([0, 1, 2, 3, 5], 4, op<=, nd);
myinsert([0, 1, 2, 3, 5], 4, op<=, op=);

val _ = print("myinsort test - nd W/O duplicates \n");

myinsort([3, 1, 8, 5, 4, 6, 9, 0, 2, 7], op<, nd);
myinsort([3, 1, 8, 5, 4, 6, 9, 0, 2, 7], op<=, nd);
myinsort([3, 1, 8, 5, 4, 6, 9, 0, 2, 7], op>, nd);
myinsort([3, 1, 8, 5, 4, 6, 9, 0, 2, 7], op>=, nd);

val _ = print("myinsort test - nd W/ duplicates \n");

myinsort([3, 1, 8, 5, 4, 6, 9, 0, 2, 7, 2, 5], op<, nd);
myinsort([3, 1, 8, 5, 4, 6, 9, 0, 2, 7, 2, 5], op<=, nd);
myinsort([3, 1, 8, 5, 4, 6, 9, 0, 2, 7, 2, 5], op>, nd);
myinsort([3, 1, 8, 5, 4, 6, 9, 0, 2, 7, 2, 5], op>=, nd);

val _ = print("myinsort test - op= W/ duplicates \n");

myinsort([3, 1, 8, 5, 4, 6, 9, 0, 2, 7, 2, 5], op<, op=);
myinsort([3, 1, 8, 5, 4, 6, 9, 0, 2, 7, 2, 5], op<=, op=);
myinsort([3, 1, 8, 5, 4, 6, 9, 0, 2, 7, 2, 5], op>, op=);
myinsort([3, 1, 8, 5, 4, 6, 9, 0, 2, 7, 2, 5], op>=, op=);

