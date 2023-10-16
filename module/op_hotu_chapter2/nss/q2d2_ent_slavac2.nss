//::///////////////////////////////////////////////
//:: Name q2d2_ent_slavauc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   When a PC crosses this trigger - start the
   auctioneers bidding..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////

void main()
{
    //Do nothing if illithids are hostile.
    if (GetLocalInt(GetModule(), "X2_Q2DIllithidHostile") > 0)
        return;

    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;


    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    object oAuction = GetObjectByTag("q2d_ill_nur1");
    object oBid2 = GetObjectByTag("q2d_ill_nur3");

    AssignCommand(oAuction, ActionStartConversation(oPC));
}
