// on entering the trigger -> start the "blocked passage" quest in the journal

#include "q5_inc_plot"
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;
    SetLocalInt(oPC, "X1_Q5PCKnowBoulder", 1);
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
       return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    SetPlot("jt_q5blocked", 1, oPC);


}
