//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick Rules (Action Script)
//:: H2a_Card_Rules.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the fact that the card trick rules have
     been explained to the player at least once.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 17, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "CardRulesExplained", TRUE);

    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Arden", 40, oPC, TRUE, TRUE);
}
