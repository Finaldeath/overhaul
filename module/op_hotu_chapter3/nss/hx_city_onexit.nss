//::///////////////////////////////////////////////
//:: City of Lost Souls (OnExit)
//:: Hx_City_OnExit.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Don't let the Scrivener follow its master
     through to another area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 3, 2003
//:://////////////////////////////////////////////

void main()
{
    //Ensure that it's the Scrivener's Master who left.
    object oPC = GetExitingObject();
    object oScrivener = GetObjectByTag("H2_Scrivener");
    object oMaster = GetMaster(oScrivener);
    if (oPC == oMaster)
    {
        //Remove the Scrivener from the party.
        RemoveHenchman(oPC, oScrivener);
        SetLocalInt(oScrivener, "X2_JUST_A_FOLLOWER", FALSE);

        //Get Previous Nav Point
        object oWP;
        string sLastNav = GetLocalString(oScrivener, "sPreviousNavPoint");
        if (sLastNav == "Treason")
        {
            oWP = GetObjectByTag("h2_rebus_treas");
        }
        if (sLastNav == "Dimension")
        {
            oWP = GetObjectByTag("h2_rebus_dimen");
        }

        //Run there.
        AssignCommand(oScrivener, ClearAllActions());
        //AssignCommand(oScrivener, ActionForceMoveToObject(oWP, TRUE, 1.0));
    }
}
