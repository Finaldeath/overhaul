//::///////////////////////////////////////////////
//:: Name q3_trig_jnahcon
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
    //Make sure PC is not in cutscene
    if (GetLocalInt(oPC, "nCutsceneNumber") == 31)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);
    object oJnah = GetObjectByTag("Q3_JNAH");
    AssignCommand(oJnah, ActionStartConversation(oPC));

}
