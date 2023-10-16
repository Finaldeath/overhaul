//::///////////////////////////////////////////////
//:: Name hx_slp_end
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sleeping Man is flagged to show up in the end
     battle with Meph.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

void main()
{
    object oSleep = GetObjectByTag("H2_SleepingMan");

    //SetLocalInt(GetModule(), "HX_SLEEPING_INVIS_SILENT", TRUE);
    SetLocalInt(GetModule(), "HX_SLEEPING_END_BATTLE", TRUE);
}
