//::///////////////////////////////////////////////
//:: The Lamplighter leaves
//:: act_lam_leave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The lamp lighter leaves
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oBeck = GetObjectByTag("q2_sirbecket");
    object oWay = GetObjectByTag("q2c_way_keepexit");
    object oAlias = GetObjectByTag("q2_alias");
    object oPC = GetFirstPC();
    location lPC = GetLocation(oPC);
//    object oMW = CreateObject(OBJECT_TYPE_PLACEABLE,"q3ai_mw_intro",lPC);
    if(GetIsObjectValid(oBeck))
    {
        AssignCommand(oBeck,ActionMoveToObject(oWay));
        AssignCommand(oBeck,ActionDoCommand(DestroyObject(OBJECT_SELF)));
    }
    SetLocalInt(oAlias,"OS_ALIAS_STORY",10);
    AssignCommand(oPC,ClearAllActions(TRUE));
    AssignCommand(oAlias,ActionStartConversation(oPC));
//    AssignCommand(oMW,ActionStartConversation(oPC));
    ActionMoveToObject(oWay);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
}
