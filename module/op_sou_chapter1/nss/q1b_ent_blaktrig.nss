//::///////////////////////////////////////////////
//:: Name q1b_ent_blaktrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Nora, a local woman, is standing outside her home
and will tearfully run to the PC and
beg him to save her husband and her child…
both of whom are still inside her home.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 10/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPlayerCharacter(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        object oNora = GetObjectByTag("q1bnora");

        AssignCommand(oNora, SpeakStringByStrRef(40363, TALKVOLUME_SHOUT));
        AssignCommand(oNora, ActionStartConversation(oPC));
    }

}
