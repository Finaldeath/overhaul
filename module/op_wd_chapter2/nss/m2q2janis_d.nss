//::///////////////////////////////////////////////
//:: User Defined
//:: m2q2Janis_d
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Janis' follow script.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 5, 2002
//:://////////////////////////////////////////////

void main()
{
    object oExit = GetObjectByTag("WP_JANIS_EXIT");
    object oRevat = GetObjectByTag("WP_REVAT_HOME");

    if (GetLocalInt(OBJECT_SELF,"NW_L_Rescued") == 10)
    {
        ClearAllActions();
        ActionCastFakeSpellAtObject(SPELL_HEAL,OBJECT_SELF);
        //ActionForceMoveToObject(oExit,TRUE,3.0,10.0);
        ActionJumpToObject(oRevat);
        ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_Rescued",15));
        ActionDoCommand(SetCommandable(TRUE));
        SetCommandable(FALSE);
    }
}
