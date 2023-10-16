//::///////////////////////////////////////////////
//:: act_dyl_militia
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The militia guard walks up to dylan
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: March 2004
//:://////////////////////////////////////////////

void main()
{
    object oMilitia = GetObjectByTag("q2_militiaguard");
    object oDylan = GetObjectByTag("q2_dylan");
    AssignCommand(oMilitia,ActionMoveToObject(oDylan));
}
