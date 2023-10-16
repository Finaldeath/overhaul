// have Nilmaldor init conv if player gets too near and did not talk to him yet.
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;

    int nSpoken = GetLocalInt(oPC, "Q2_SPOKEN_TO_NILMALDOR");
    if(nSpoken == 1)
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
         return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    AssignCommand(oPC, ClearAllActions());
    object oNilmaldor = GetNearestObjectByTag("Q2_NILMALDOR");
    AssignCommand(oNilmaldor, ActionStartConversation(oPC));
}
