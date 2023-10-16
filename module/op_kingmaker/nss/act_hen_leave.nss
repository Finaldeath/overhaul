//::///////////////////////////////////////////////
//:: act_hen_leave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    NPC walks away and disappears
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    //NPC walks away and destroys self
    object oCal = GetObjectByTag("q3_sur_cal");
    object oKai = GetObjectByTag("q3_sur_kai");
    object oTrp = GetObjectByTag("q3_sur_trp");
    object oJab = GetObjectByTag("q3_sur_jab");
    object oWay = GetNearestObjectByTag("q3_map_exit");
    if(GetIsObjectValid(oCal))
    {
        AssignCommand(oCal,ActionMoveToObject(oWay));
        AssignCommand(oCal,ActionDoCommand(DestroyObject(OBJECT_SELF)));
    }
    if(GetIsObjectValid(oKai))
    {
        AssignCommand(oKai,ActionMoveToObject(oWay));
        AssignCommand(oKai,ActionDoCommand(DestroyObject(OBJECT_SELF)));
    }
    if(GetIsObjectValid(oTrp))
    {
        AssignCommand(oTrp,ActionMoveToObject(oWay));
        AssignCommand(oTrp,ActionDoCommand(DestroyObject(OBJECT_SELF)));
    }
    if(GetIsObjectValid(oJab))
    {
        AssignCommand(oJab,ActionMoveToObject(oWay));
        AssignCommand(oJab,ActionDoCommand(DestroyObject(OBJECT_SELF)));
    }
}
