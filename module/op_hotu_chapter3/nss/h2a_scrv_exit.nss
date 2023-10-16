//::///////////////////////////////////////////////
//:: Scrivener, Exit (Action Script)
//:: H2a_Scrv_Exit.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Have the Scrivener escape area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

void main()
{
    object oWP = GetObjectByTag("WP_Hellbreath_2");
    ActionMoveToObject(oWP, TRUE, 1.0);
    SetLocalInt(GetModule(), "HX_SCRIV_CUT_DONE", TRUE);
}
