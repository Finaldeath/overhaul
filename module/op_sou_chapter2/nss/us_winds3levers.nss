//::///////////////////////////////////////////////
//:: Door Levers, 3rd Floor, Temple of Winds (OnUse)
//:: Us_Winds3Levers.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the pulling of the 4 levers.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 21, 2003
//:://////////////////////////////////////////////

void main()
{
    //Get my activation state and set it to the opposite.
    object oArea = GetArea(OBJECT_SELF);
    int bActive = GetLocalInt(OBJECT_SELF, "bActive");
    string sMyTag = GetTag(OBJECT_SELF);
    string sTarget = sMyTag+"_Fake";
    int iNth = 1;
    object oTarget = GetNearestObjectByTag(sTarget, OBJECT_SELF, iNth);
    if (bActive == FALSE)
    {
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SetLocalInt(OBJECT_SELF, "bActive", TRUE);
        SetLocalInt(oArea, sMyTag, TRUE);
        //Loop through my fakes and set their animation state to the same as mine.
        while (iNth <= 3)
        {
            AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
            //Update the loop variables.
            iNth++;
            oTarget = GetNearestObjectByTag(sTarget, OBJECT_SELF, iNth);
        }

        //Give XP to everyone (available multiple times)
        int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");
        if (bDoOnce == FALSE)
        {
            object oPC_XP = GetFirstPC();
            while (oPC_XP != OBJECT_INVALID)
            {
                int iXP = FloatToInt(GetJournalQuestExperience("Journ_Main_End") * 0.02);
                GiveXPToCreature(oPC_XP, iXP);
                oPC_XP = GetNextPC();
            }
            SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
        }
    }
    else
    {
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        SetLocalInt(OBJECT_SELF, "bActive", FALSE);
        SetLocalInt(OBJECT_SELF, sMyTag, FALSE);
        //Loop through my fakes and set their animation state to the same as mine.
        while (iNth <= 3)
        {
            AssignCommand(oTarget, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
            //Update the loop variables.
            iNth++;
            oTarget = GetNearestObjectByTag(sTarget, OBJECT_SELF, iNth);
        }
    }

    //If all levers are active, unlock & open the doors.
    int bNorth = GetLocalInt(oArea, "Lever_N");
    int bEast = GetLocalInt(oArea, "Lever_E");
    int bSouth = GetLocalInt(oArea, "Lever_S");
    int bWest = GetLocalInt(oArea, "Lever_W");

    if (bNorth == TRUE &&
        bEast == TRUE &&
        bSouth == TRUE &&
        bWest == TRUE)
    {
        object oNorthDoor = GetNearestObjectByTag("Winds_03_N_Winds_04_N");
        object oEastDoor = GetNearestObjectByTag("Winds_03_E_Winds_04_E");
        object oSouthDoor = GetNearestObjectByTag("Winds_03_S_Winds_04_S");
        object oWestDoor = GetNearestObjectByTag("Winds_03_W_Winds_04_W");

        SetLocked(oNorthDoor, FALSE);
        SetLocked(oEastDoor, FALSE);
        SetLocked(oSouthDoor, FALSE);
        SetLocked(oWestDoor, FALSE);

        AssignCommand(oNorthDoor, ActionOpenDoor(oNorthDoor));
        AssignCommand(oEastDoor, ActionOpenDoor(oEastDoor));
        AssignCommand(oSouthDoor, ActionOpenDoor(oSouthDoor));
        AssignCommand(oWestDoor, ActionOpenDoor(oWestDoor));
    }
}
