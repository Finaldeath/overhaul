//::///////////////////////////////////////////////
//:: Library, Wise Wind Battle (Heartbeat)
//:: Hb_Library_05.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Keep Karsus & Sir William moving in the Wise
     Wind Battle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 28, 2003
//:://////////////////////////////////////////////

void main()
{
    object oWiseWind = GetObjectByTag("WiseWind");
    object oKarsus = GetNearestObjectByTag("Karsus", oWiseWind);
    object oWilliam = GetNearestObjectByTag("SirWilliam", oWiseWind);

    if (oKarsus != OBJECT_INVALID &&
        oWiseWind != OBJECT_INVALID)
    {
        int iSee = GetObjectSeen(oWiseWind, oKarsus);
        if (iSee == FALSE)
        {
            AssignCommand(oKarsus, ActionMoveToObject(oWiseWind, TRUE));
/*DEBUG*///AssignCommand(oKarsus, SpeakString("DEBUG: Moving to the Wise Wind..."));
        }
    }
    if (oWilliam != OBJECT_INVALID &&
        oWiseWind != OBJECT_INVALID)
    {
        int iSee = GetObjectSeen(oWiseWind, oWilliam);
        if (iSee == FALSE)
        {
            AssignCommand(oWilliam, ActionMoveToObject(oWiseWind, TRUE, 2.0));
            AssignCommand(oWilliam, ActionAttack(oWiseWind));
/*DEBUG*///AssignCommand(oWilliam, SpeakString("DEBUG: Attacking the Wise Wind..."));
        }
    }
}
