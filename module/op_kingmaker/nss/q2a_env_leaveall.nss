//::///////////////////////////////////////////////
//:: Everyone Leaves
//:: q2a_env_leaveall
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Everyone leaves the scene
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oFeran = GetObjectByTag("q2_feran");
    FadeToBlack(oPC);
    object oWay = GetObjectByTag("q2b_way_momhome");
    object oHome = GetObjectByTag("q2c25b_way_enivd");
    object oFerHome = GetObjectByTag("q2ca_feran_office");
    AssignCommand(oPC,ActionJumpToObject(oWay));
    AssignCommand(oFeran,ActionJumpToObject(oFerHome));
    DelayCommand(0.5,ActionJumpToObject(oHome));
    FadeFromBlack(oPC);
}
