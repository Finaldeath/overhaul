//::///////////////////////////////////////////////
//:: act_env_beckjump
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Becket is jumped to the Keep
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Jan 2004
//:://////////////////////////////////////////////

void main()
{
    object oBeck = GetObjectByTag("q2_sirbecket");
    object oWay = GetObjectByTag("q2c25_way_beccas");
    AssignCommand(oBeck,ActionJumpToObject(oWay));

}
