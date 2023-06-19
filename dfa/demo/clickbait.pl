
% https://www.techytalk.info/prolog-programming-gprolog-linux/

object(idd_fish1, idc_fish,['fish1a','fish1a','fish1a']).
object(idd_fish2, idc_fish,['fish2a','fish2a','fish2a']).
object(idd_fish3, idc_fish,['fish3a','fish3a','fish3a']).


/* two different ways to implement a predicate.
 The first approach uses a universal predicate 'map_obj'.
 Query:
 map_obj(op_burn, idd_fish1, Result).
*/
map_obj(op_burn,idd_fish1,idd_fishash1).
map_obj(op_burn,idd_fish2,idd_fishash2).
map_obj(op_burn,idd_fish3,idd_fishash3).

/* the second uses a definite predicate 'obj_burn':
  Query:
  op_burn(idd_fish1, Result).

*/
op_burn(idd_fish1,idd_fishash1).
op_burn(idd_fish2,idd_fishash2).
op_burn(idd_fish3,idd_fishash3).


/* here we have two options for declaring state machine transitions. The first uses the state machine name as the functor ... */
m_clickbait('0','B1','Z_EPSILON','','','ASSIGN(WOBJECT,IDD_BAIT0);SHOW(WOBJECT);','').
m_clickbait('B1','2','CLICK','','','ASSIGN(WOBJECT,IDD_BAIT1);SHOW(WOBJECT);','').
m_clickbait('2','3','CLICK','','','ASSIGN(WOBJECT,IDD_BAIT2);SHOW(WOBJECT);','').
m_clickbait('3','4','CLICK','','','ASSIGN(WOBJECT,IDD_BAIT3);SHOW(WOBJECT);','').
m_clickbait('4','0','CLICK','','','','').
 
 /* but requires a unique recognizer for each state machine .... */
recognize_clickbait(Start,[Input|Inputs],[Start|States]) :-
    m_clickbait(Start,State,Input,_,_,_,_),
    walk(State, Inputs, States).
recognize_clickbait(_,[],[]).

/* this uses a common funcrot "transition" where the first parameter is the name of the state machine. This
   more closely matches our current database schema ...*/
transition(m_clickbait,'0','B1','Z_EPSILON','','','ASSIGN(WOBJECT,IDD_BAIT0);SHOW(WOBJECT);','').
transition(m_clickbait,'B1','2','CLICK','','','ASSIGN(WOBJECT,IDD_BAIT1);SHOW(WOBJECT);','').
transition(m_clickbait,'2','3','CLICK','','','ASSIGN(WOBJECT,IDD_BAIT2);SHOW(WOBJECT);','').
transition(m_clickbait,'3','4','CLICK','','','ASSIGN(WOBJECT,IDD_BAIT3);SHOW(WOBJECT);','').
transition(m_clickbait,'3','5','GRAB','','','ASSIGN(WOBJECT,IDD_BAIT3);SHOW(WOBJECT);','').
transition(m_clickbait,'4','0','CLICK','','','','').
transition(m_clickbait,'4','0','CLICK','','','','').
 
recognize(Automaton,Start,[Input|Inputs],[Start|States]) :-
    transition(Automaton,Start,State,Input,_,_,_,_),
    write(Start),write(' --> '),write(State),nl,
    recognize(Automaton,State, Inputs, States).
recognize(_,_,[],[]).

/*
--- unfortunately this only works with functor/1.
recog(Automaton,Start,[Input|Inputs],[Start|States]) :-
    call(Automaton(Start,State,Input,_,_,_,_)),
    write(Start),write(' --> '),write(State),nl,
    recog(Automaton,State, Inputs, States).
recog(_,_,[],[]).
*/


/*
Test input:

[clickbait]. 

recognize(m_clickbait,'0',['Z_EPSILON'],Path).
recognize(m_clickbait,'0',['Z_EPSILON','CLICK','CLICK'],Path).
recognize(m_clickbait,'0',['Z_EPSILON','CLICK','CLOCK'],Path).


recognize_clickbait('0',['Z_EPSILON'],Path).

*/