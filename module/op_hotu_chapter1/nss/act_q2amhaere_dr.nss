//::///////////////////////////////////////////////
//:: Name: act_q2amhaere_dr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    After Mhaere tells you to go report about the
    attack - unlock the front door of the YP.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 27/02
//:://////////////////////////////////////////////


void main()
{
    object oDoor = GetObjectByTag("q2a_yp_int");
    SetLocked(oDoor, FALSE);
    SetLocalInt(GetModule(), "nMhaereDialog1", 1);

    //Make sure henchmen are no longer immortal
    object oTalice = GetObjectByTag("xp_hen_talice");
    object oKrill = GetObjectByTag("xp_hen_krill");
    SetPlotFlag(oTalice, FALSE);
    SetPlotFlag(oKrill, FALSE);

}
