//::///////////////////////////////////////////////
//:: Stiletto Leaves
//:: q2c24b_stl_leave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Stiletto leaves the area
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("q2ac24c_at_q2ac24a");
    object oEnivid = GetObjectByTag("q2_enivid");
    object oGone = GetObjectByTag("q2_factguy");

    SetLocalInt(oEnivid,"OS_ENIVID_STILETTO",20);

    ActionMoveToObject(oDoor,TRUE);
    DelayCommand(5.0f, JumpToObject(oGone,FALSE));

    SetLocalInt(GetFirstPC(),"os_freeprisoner",20);
}
