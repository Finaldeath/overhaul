//::///////////////////////////////////////////////
//:: Arrest Becket
//:: act_lam_arrestb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The guards escort Becket out
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oBeck = GetObjectByTag("q2_sirbecket");
    object oGuard1 = GetObjectByTag("q2_keepguard",0);
    object oGuard2 = GetObjectByTag("q2_keepguard",1);
    object oDoor = GetObjectByTag("q2c_way_keepexit");
    object oPC = GetFirstPC();

    SetLocalInt(GetModule(), "BECKET_ARRESTED", TRUE);

    GiveXPToCreature(oPC, 500);
    AssignCommand(oGuard1,ActionMoveToObject(oBeck));
    AssignCommand(oGuard1,ActionMoveToObject(oBeck));
    AssignCommand(oBeck,ActionMoveToObject(oDoor));
    AssignCommand(oGuard1,ActionMoveToObject(oDoor));
    AssignCommand(oGuard2,ActionMoveToObject(oDoor));
    AssignCommand(oBeck,ActionDoCommand(DestroyObject(oBeck)));
    AssignCommand(oGuard1,ActionDoCommand(DestroyObject(oGuard1)));
    AssignCommand(oGuard2,ActionDoCommand(DestroyObject(oGuard2)));
}
