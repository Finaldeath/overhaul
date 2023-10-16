//::///////////////////////////////////////////////
//:: Module OnItemAcquired Script
//:: OnAcquireItem.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Update journal entries and MainPlot local on
    acquisition of Morgroth's Heart
*/
//:://////////////////////////////////////////////

void main()
{
    object oItem = GetModuleItemAcquired();
    object oPC = GetItemPossessor(oItem);
    string sTag = GetTag(oItem);

    if (GetIsPC(oPC) == TRUE)
    {
        if (sTag == "MorgrothsHeart")
        {
            AddJournalQuestEntry("MainPlot", 50, oPC);
            SetLocalInt(GetModule(), "MainPlot", 2);
        }
    }
}
