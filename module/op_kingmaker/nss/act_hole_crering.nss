//::///////////////////////////////////////////////
//:: Create Ring
//:: act_hole_crering
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a ring on the grate on the other side.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oGrate = GetObjectByTag("q2_ring_grate");
    CreateItemOnObject("q2_itm_beckring",oGrate);
}
