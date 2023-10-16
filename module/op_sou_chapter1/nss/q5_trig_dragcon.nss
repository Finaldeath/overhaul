//::///////////////////////////////////////////////
//:: Name q5_trig_dragcon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have Tymofarrar initiate conversation with
    the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: May 5/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == FALSE)
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oDragon = GetObjectByTag("NW_DRGWHITE001");
    AssignCommand(oDragon, ActionStartConversation(oPC));

}
