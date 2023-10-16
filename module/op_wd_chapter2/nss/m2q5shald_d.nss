//::///////////////////////////////////////////////
//:: User Defined
//:: m2q5Shald_d
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shaldrissa's follow script.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oFather = GetObjectByTag("M2Q1CHAEROM");
    object oExit = GetWaypointByTag("WP_SHALD_EXIT");

    if (GetLocalInt(OBJECT_SELF,"NW_L_Rescued") == 10)
    {
        ClearAllActions();
        ActionForceMoveToObject(oExit,TRUE,3.0,10.0);
        ActionJumpToObject(oFather,TRUE);
        ActionDoCommand(SetLocalInt(oFather,"NW_KENDRACK_PLOT",3));
        ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Rescued",15));
        ActionDoCommand(SetCommandable(TRUE));
        SetCommandable(FALSE);
    }
    else if (GetLocalInt(OBJECT_SELF,"NW_L_Rescued") == 0 &&
             GetLocalInt(OBJECT_SELF,"NW_L_CallForHelp") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_CallForHelp",10);
        DelayCommand(8.0,SetLocalInt(OBJECT_SELF,"NW_L_CallForHelp",0));
        ActionStartConversation(OBJECT_SELF);
    }
}
