//::///////////////////////////////////////////////
//:: Dread Sarcophagus (OnDeath)
//:: Dt_DreadSarcoph.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give XP and spawn in sparkly if I drop the
     key.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////

void main()
{
    //Give XP to everyone in the area
    int iNth = 1;
    object oPC_XP = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
    while (oPC_XP != OBJECT_INVALID)
    {
        int iXP = FloatToInt(GetJournalQuestExperience("Journ_Crypt_End") * 0.02);
        GiveXPToCreature(oPC_XP, iXP);
        iNth++;
        oPC_XP = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNth);
    }

    //If I'm dropping the key, spawn in a sparkly to highlight it.
    object oKey = GetItemPossessedBy(OBJECT_SELF, "Key_Crypt_01");
    if (oKey != OBJECT_INVALID)
    {
        location lLoc = GetLocation(OBJECT_SELF);
        CreateObject(OBJECT_TYPE_PLACEABLE, "plc_magicgreen", lLoc, FALSE, "Key_Crypt_01_Sparkly");
    }

    //If I'm the last one, flag the area as restable
    object oSarcophagus = GetNearestObjectByTag("Dread_Sarcophagus");
    object oArea = GetArea(OBJECT_SELF);
    if (oSarcophagus == OBJECT_INVALID)
    {
        SetLocalInt(oArea, "bAllowRest", TRUE);
    }
}
