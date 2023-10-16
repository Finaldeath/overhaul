//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick Rules (Condition Script)
//:: H2c_Card_Rules.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the rules to the card trick
     have been explained at least once.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 17, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bRules = GetLocalInt(OBJECT_SELF, "CardRulesExplained");
    if (bRules == TRUE)
    {
        object oTable = GetObjectByTag("H2_CardTable");
        object oPC = GetPCSpeaker();
        OpenInventory(oTable, oPC);
        return TRUE;
    }
    return FALSE;
}
