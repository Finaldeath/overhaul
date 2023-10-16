//::///////////////////////////////////////////////
//:: km_on_pcdeath
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Notify the PC that its now dead and what
    choices it can make if any.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: May 2004
//:://////////////////////////////////////////////

void main()
{
    object oPossable1 = GetLastPlayerDied();
    object oPossable2 = GetLastPlayerDying();
    object oModule = GetModule();
    object oPC = OBJECT_INVALID;

    // find a valid PC that has died
    if(GetIsPC(oPossable1))
    {
        oPC = oPossable1;
    }
    else if(GetIsPC(oPossable2))
    {
        oPC = oPossable2;
    }

    if (oPC != OBJECT_INVALID)
    {
        int iItemCharges = 0;
        object oWeapon = OBJECT_INVALID;
        string sMSG;

        oWeapon = GetItemPossessedBy(oPC, "os_magicweapon");
        iItemCharges = GetItemCharges(oWeapon);

        // if the player has more then two charges give them the GUI option
        // to come back to life if they choose to continue.
        if ((GetLocalInt(oModule, "MW_ACTIVATE") != TRUE))
        {
            sMSG = "You have been killed.";
            PopUpDeathGUIPanel(oPC, FALSE, FALSE, 0, sMSG);
        }
        else if (iItemCharges > 2)
        {
            sMSG = "You have been killed. Your Magic Weapon can resurrect you ";
            sMSG += "at a safe location but, once it has run out of charges, ";
            sMSG += "you will no longer be able to come back.";

            PopUpDeathGUIPanel(oPC, TRUE, FALSE, 0, sMSG);
        }
        else
        {
            sMSG = "You have been killed. Your Magic Weapon no longer has ";
            sMSG += "enough charges to resurrect you.";

            PopUpDeathGUIPanel(oPC, FALSE, FALSE, 0, sMSG);
        }

        // * make friendly to Each of the 3 common factions
        AssignCommand(oPC, ClearAllActions());
        // * Note: waiting for Sophia to make SetStandardFactionReptuation to clear all personal reputation
        if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPC) <= 10)
        {   SetLocalInt(oPC, "NW_G_Playerhasbeenbad", 10); // * Player bad
            SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 80, oPC);
        }
        if (GetStandardFactionReputation(STANDARD_FACTION_MERCHANT, oPC) <= 10)
        {   SetLocalInt(oPC, "NW_G_Playerhasbeenbad", 10); // * Player bad
            SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 80, oPC);
        }
        if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPC) <= 10)
        {   SetLocalInt(oPC, "NW_G_Playerhasbeenbad", 10); // * Player bad
            SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 80, oPC);
        }
    }
}


