//::///////////////////////////////////////////////
//:: Name q2aseer_endcombat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default Combat Round End script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "X2_Q2ABattle2Wave1") != 1)
        return;
    ExecuteScript("nw_c2_default3", OBJECT_SELF);
}
