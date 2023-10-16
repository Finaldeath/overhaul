//::///////////////////////////////////////////////
//:: Name q2d_ent_gatetrig
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

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    //Have mindflayer speak with the PC
    object oGatekeeper = GetObjectByTag("q2dgatekeeper");
    AssignCommand(oGatekeeper, ActionStartConversation(oPC));
    //Have two guards show up to intimidate the pc
    object oThug1 = GetObjectByTag("q2dthrallshock1a");
    object oThug2 = GetObjectByTag("q2dthrallshock1b");
    AssignCommand(oThug1, ActionMoveToObject(oPC, FALSE, 4.0));
    AssignCommand(oThug2, ActionMoveToObject(oPC, FALSE, 4.0));

}
