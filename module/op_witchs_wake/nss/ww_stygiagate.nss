//::///////////////////////////////////////////////
//:: Witchwork: Plane of Sorrows, Gate to Stygia
//:: WW_StygiaGate.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Starts the door conversation if the player is
     flagged as having died 3 times (ie: coming
     back from the Stygia side). Otherwise it
     opens the locked door.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 22, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    int iDeaths = GetLocalInt(oPC, "iDeaths");

    if (iDeaths > 3)
    {
        ActionStartConversation(oPC);
    }
    else
    {
        //If door is currently locked...
        int bLocked = GetLocked(OBJECT_SELF);
        if (bLocked == TRUE)
        {
            //Unlock it...
            SetLocked(OBJECT_SELF, FALSE);
            //...and open it.
            ActionOpenDoor(OBJECT_SELF);
        }
    }
}
