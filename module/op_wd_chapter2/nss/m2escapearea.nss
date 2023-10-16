//::///////////////////////////////////////////////
//:: Escape Area
//:: m2escapearea
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 23, 2002
//:://////////////////////////////////////////////

void main()
{
    object oExit = GetNearestObjectByTag("NW_EXIT");
    ClearAllActions();
    SetLocalInt(OBJECT_SELF,"NW_L_Busy",10);
    if (GetIsObjectValid(oExit) && GetDistanceToObject(oExit) < 20.0)
    {
        ActionForceMoveToObject(oExit,TRUE,1.0,20.0);
    }
    else
    {
        ActionMoveAwayFromObject(GetPCSpeaker(),TRUE,10.0);
    }
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
