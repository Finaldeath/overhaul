//::///////////////////////////////////////////////
//:: Name q2d_ent_gatetrg2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gatekeeper will initiate conversation with any
    PCs that come close..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 30/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oGatekeeper = GetObjectByTag("q2dgatekeeper");
    //Do nothing if the Illithid has already talked to a PC
    if (GetLocalInt(oGatekeeper,"NW_L_TALKLEVEL") >= 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    //Have mindflayer speak with the PC

    AssignCommand(oGatekeeper, ActionStartConversation(oPC));


}
