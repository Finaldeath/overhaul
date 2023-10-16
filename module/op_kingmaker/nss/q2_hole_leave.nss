//::///////////////////////////////////////////////
//:: Everyone Leaves
//:: q2_hole_leave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The maid and Sir Beckett leave
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oMaid = GetObjectByTag("q2_elly_maid");
    object oBeck = GetObjectByTag("q2_sirbeckett");
    DestroyObject(oMaid);
    DestroyObject(oBeck);
}
