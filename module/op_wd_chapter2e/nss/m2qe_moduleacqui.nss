//::///////////////////////////////////////////////
//:: m2qE Module OnAcquireItem Event script
//:: m2qE_ModuleAcqui
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    1. If the item is the Portal Instructions,
       update the main journal entry to include
       info about the portal system.
    2. If the item is Maugrim's Journal, Maugrim's
       Letter, or Aribeth's Book, update the main
       journal entry to discuss Aribeth.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 7, 2002
//:://////////////////////////////////////////////

void main()
{
    object oItem = GetModuleItemAcquired();
    string sTag = GetTag(oItem);
    object oPC = GetItemPossessor(oItem);

// 1. If the item is the Portal Instructions,
//    update the main journal entry to include
//    info about the portal system.
    //if (sTag == "2Q6_PortalInst")
    //{
    //    AddJournalQuestEntry("m2qE_Main", 30, oPC);
    //}

// 2. If the item is Maugrim's Journal, Maugrim's
//    Letter, or Aribeth's Book, update the main
//    journal entry to discuss Aribeth.
    //if (sTag == "2Q6_MaugrimLette" ||
    //    sTag == "2Q6_MaugrimJoural" ||
    //    sTag == "2Q4_AribethBook")
    //{
    //    AddJournalQuestEntry("m2qE_Main", 40, oPC);
    //}
// 3. If the item is the high captains seal then add
//    Journal entry about being to go to Aarin
    if(sTag == "2Q4_NecroParchment")
    {
        AddJournalQuestEntry("m2q4_Main", 51, oPC);
    }

// 4. If the item is the high captains seal then add
//    Journal entry about being to go to Aarin
    if(sTag == "2q4e_CryptDoor")
    {
        AddJournalQuestEntry("m2q4_Main", 52, oPC);
    }

// 5. If the item is the high captains seal then add
//    Journal entry about being to go to Aarin
    if(sTag == "M2Q6A0SEAL")
    {
        AddJournalQuestEntry("m2q4_Main", 60, oPC);
    }


}
