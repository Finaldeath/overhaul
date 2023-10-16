//::///////////////////////////////////////////////
//:: Scrivener, Go to Last Nav Point (Action Script)
//:: H2a_Scrv_NavLast.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Exit party and return to previous Nav Point.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

void main()
{
    //Remove from party.
    object oPC = GetPCSpeaker();
    RemoveHenchman(oPC, OBJECT_SELF);
    SetLocalInt(OBJECT_SELF, "X2_JUST_A_FOLLOWER", FALSE);

    //Get Previous Nav Point
    object oWP;
    string sLastNav = GetLocalString(OBJECT_SELF, "sPreviousNavPoint");
    if (sLastNav == "Treason")
    {
        oWP = GetObjectByTag("h2_rebus_treas");
    }
    if (sLastNav == "Dimension")
    {
        oWP = GetObjectByTag("h2_rebus_dimen");
    }

    //Run there.
    ActionForceMoveToObject(oWP, TRUE, 1.0);
}

