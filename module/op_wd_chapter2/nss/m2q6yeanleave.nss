//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6YeanLeave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Yeanasha escapes area.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 15, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q06IELTUTHJOUR")))
    {
        ActionForceMoveToObject(GetWaypointByTag("WP_YEANASHAEXIT"),TRUE);
        ActionDoCommand(DestroyObject(OBJECT_SELF));
        SetCommandable(FALSE);
    }
}
