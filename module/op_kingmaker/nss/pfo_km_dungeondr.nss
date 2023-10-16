//::///////////////////////////////////////////////
//:: Check forthe proper keys to the final door
//:: pfo_km_dunfeondr
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script checks for the proper keys on the
    player object and opens the pasage down int the
    bastion of the enemy once the PC collects them
    all.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();

    string sBarkString = "You need five keys to open this door, ";
    string sSecondStr = "you currently have none of them.";

    object oKey1 = GetItemPossessedBy(oPC, "KoboldKey");
    object oKey2 = GetItemPossessedBy(oPC, "GoblinKey");
    object oKey3 = GetItemPossessedBy(oPC, "OrcKey");
    object oKey4 = GetItemPossessedBy(oPC, "DuergarKey");
    object oKey5 = GetItemPossessedBy(oPC, "DrowKey");

    int iKeyCount = 0;

    // count up the number of keys
    if (oKey1 != OBJECT_INVALID)
    {
        iKeyCount += 1;
    }

    if (oKey2 != OBJECT_INVALID)
    {
        iKeyCount += 1;
    }

    if (oKey3 != OBJECT_INVALID)
    {
        iKeyCount += 1;
    }

    if (oKey4 != OBJECT_INVALID)
    {
        iKeyCount += 1;
    }

    if (oKey5 != OBJECT_INVALID)
    {
        iKeyCount += 1;
    }

    // open the door or build a floaty string
    if (iKeyCount == 5)
    {
        SetLocked(OBJECT_SELF, FALSE);
        DelayCommand(0.5,
            AssignCommand(OBJECT_SELF, ActionOpenDoor(OBJECT_SELF)));

        DestroyObject(oKey1);
        DestroyObject(oKey2);
        DestroyObject(oKey3);
        DestroyObject(oKey4);
        DestroyObject(oKey5);
    }
    else
    {
        if (iKeyCount == 1)
        {
            sSecondStr = "you currently have one of the keys.";
        }
        else if (iKeyCount == 2)
        {
            sSecondStr = "you currently have two of the keys.";
        }
        else if (iKeyCount == 3)
        {
            sSecondStr = "you currently have three of these keys.";
        }
        else if (iKeyCount == 4)
        {
            sSecondStr = "you currently have four of these keys.";
        }

        FloatingTextStringOnCreature(sBarkString + sSecondStr, oPC);
    }
}

