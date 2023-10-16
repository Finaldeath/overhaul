//::///////////////////////////////////////////////
//:: Ashtara the Asabi Merchant (Action - Unlock Towers)
//:: A_Ashtara_Towers.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Unlock the doors to the 3 towers.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 24, 2003
//:://////////////////////////////////////////////

void main()
{
    object CryptA = GetObjectByTag("UndrentideA_Crypt_01A");
    object CryptB = GetObjectByTag("UndrentideB_Crypt_01B");
    object LibraryA = GetObjectByTag("UndrentideA_Library_01A");
    object LibraryB = GetObjectByTag("UndrentideB_Library_01B");
    object WizardA = GetObjectByTag("UndrentideA_Wizard_01A");
    object WizardB = GetObjectByTag("UndrentideB_Wizard_01B");

    //Unlock the doors.
    SetLocked(CryptA, FALSE);
    SetLocked(CryptB, FALSE);
    SetLocked(LibraryA, FALSE);
    SetLocked(LibraryB, FALSE);
    SetLocked(WizardA, FALSE);
    SetLocked(WizardB, FALSE);

    //Set Ashtara's local
    SetLocalInt(OBJECT_SELF, "bPostPlot", TRUE);

    //Add Journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("Journ_Ashtara_End", 1, oPC, TRUE, TRUE);

    //Remove all other entries in this series.
    RemoveJournalQuestEntry("Journ_Ashtara_10", oPC, TRUE, TRUE);
    RemoveJournalQuestEntry("Journ_Ashtara_20", oPC, TRUE, TRUE);
    RemoveJournalQuestEntry("Journ_Ashtara_30", oPC, TRUE, TRUE);
    RemoveJournalQuestEntry("Journ_Ashtara_40", oPC, TRUE, TRUE);
    RemoveJournalQuestEntry("Journ_Ashtara_50", oPC, TRUE, TRUE);
    RemoveJournalQuestEntry("Journ_Ashtara_60", oPC, TRUE, TRUE);

    //Distribute XP to everyone
    object oPC_XP = GetFirstPC();
    while (oPC_XP != OBJECT_INVALID)
    {
        int bXP = GetLocalInt(oPC_XP, "XP_Ashtara_04");
        if (bXP == FALSE)
        {
            SetLocalInt(oPC_XP, "XP_Ashtara_04", TRUE);
            int iXP = FloatToInt(GetJournalQuestExperience("Journ_Ashtara_End") * 0.30);
            GiveXPToCreature(oPC_XP, iXP);
        }
        oPC_XP = GetNextPC();
    }

    //Flag the Undrentide areas as being restable
    object oCamp = GetObjectByTag("Undrentide_01");
    object oEast = GetObjectByTag("Undrentide_02");
    object oNorth = GetObjectByTag("Undrentide_03");
    object oWest = GetObjectByTag("Undrentide_04");
    SetLocalInt(oCamp, "bAllowRest", TRUE);
    SetLocalInt(oEast, "bAllowRest", TRUE);
    SetLocalInt(oNorth, "bAllowRest", TRUE);
    SetLocalInt(oWest, "bAllowRest", TRUE);

    //Have the Asabi Thralls make progress on the passageway
    int iThrallCount = 1;
    object oThrall = GetObjectByTag("AsabiLooter", iThrallCount);
    while (oThrall != OBJECT_INVALID)
    {
        //Destroy the nearest rubble pieces
        object oRubble = GetNearestObjectByTag("AsabiRubble", oThrall);
        DestroyObject(oRubble);

        //Update Loop variables
        iThrallCount++;
        oThrall = GetObjectByTag("AsabiLooter", iThrallCount);
    }

    //Destroy the Golem-Maker's Ring
    object oRing = GetObjectByTag("GolemMakersRing");
    DestroyObject(oRing);

}
