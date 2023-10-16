//::///////////////////////////////////////////////
//:: PC Leaves
//:: act_lam_pcleaveb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC leaves after Becket makes him/her banner
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oWay = GetObjectByTag("q1_way_outside");
    object oDoor = GetObjectByTag("q1aa_at_q2aa");
    object oIllithid = GetObjectByTag("q1ab_at_q3ak2");
    object oMap = GetObjectByTag("q1_map_illithid");
    SetMapPinEnabled(oMap,1);
    SetLocked(oIllithid,FALSE);
    SetLocalInt(oPC,"OS_BANNER",10);
    AssignCommand(oDoor,ActionCloseDoor(oDoor));
    SetLocked(oDoor,TRUE);
    AssignCommand(oPC,ActionJumpToObject(oWay));
}
