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

#include "nw_i0_plot"

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
    object oBid1 = GetObjectByTag("q2d_ill_nur2");
    object oBid2 = GetObjectByTag("q2d_ill_nur3");

    AssignCommand(oAuction, PlaySpeakSoundByStrRef(85707));//"We will begin bidding on the next lot soon."

    DelayCommand(2.5, AssignCommand(oBid1, PlaySpeakSoundByStrRef(85708)));//"A human female? I have yet to purchase a human thrall."

}
