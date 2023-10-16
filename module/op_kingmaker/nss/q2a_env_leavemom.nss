//::///////////////////////////////////////////////
//:: q2a_env_leavemom
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    MommaJi, Feran, Dylan, and Dynschall Leave
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oMomma = GetObjectByTag("q2_mommaji");
    object oDyns = GetObjectByTag("q2_dynschall");
    object oFeran = GetObjectByTag("q2_feran");

    object oKeep = GetObjectByTag("q2ca_feran_office");
    object oKeep2 = GetObjectByTag("q2ca_feran_office");
    object oHome = GetObjectByTag("q2b_way_momhome");
    object oHome2 = GetObjectByTag("q2b_way_momhome");
    object oTemple = GetObjectByTag("q2c17_way_dyns");
    object oTemple2 = GetObjectByTag("q2c17_way_dyns");

    AssignCommand(oMomma,ActionMoveToObject(oHome));
    AssignCommand(oMomma,ActionJumpToObject(oHome2));
    AssignCommand(oFeran,ActionMoveToObject(oKeep));
    AssignCommand(oFeran,ActionJumpToObject(oKeep2));
    AssignCommand(oDyns,ActionMoveToObject(oTemple));
    AssignCommand(oDyns,ActionJumpToObject(oTemple2));
}

