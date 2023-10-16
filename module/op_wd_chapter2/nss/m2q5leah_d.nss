//::///////////////////////////////////////////////
//:: User Defined
//:: m2q5Leah_d
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Leah's follow script.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oFarmer = GetObjectByTag("WP_LEAH");
    object oEarring = GetItemPossessedBy(OBJECT_SELF,"M2Q05ILEAHRING");

    if (GetLocalInt(OBJECT_SELF,"NW_L_Rescued") == 10)
    {
        ClearAllActions();
        ActionForceMoveToObject(oFarmer,TRUE,3.0,10.0);
        ActionDoCommand(DestroyObject(oEarring));
        ActionDoCommand(SetLocalInt(GetModule(),"NW_G_LEAH_HOME",10));
        ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Rescued",15));
        ActionDoCommand(SetCommandable(TRUE));
        SetCommandable(FALSE);
    }
}
