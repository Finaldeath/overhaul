//::///////////////////////////////////////////////
//:: User Defined
//:: m2q6RitualExit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Morag and Aribeth exit through the portal.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 15, 2001
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object oExit = GetWaypointByTag("WP_RITUALEXIT");

    switch (nEvent)
    {
        case 600:
            ActionMoveToObject(oExit);
            ActionDoCommand(DestroyObject(OBJECT_SELF));
            SetCommandable(FALSE);
        break;
    }
}
