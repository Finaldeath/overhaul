//::///////////////////////////////////////////////
//:: Name q2aseer_ondamage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default OnDamaged script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "X2_Q2ABattle2Wave1") != 1)
        return;
    ExecuteScript("nw_c2_default6", OBJECT_SELF);
}
