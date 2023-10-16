//::///////////////////////////////////////////////
//:: M4_WORDACQ
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player acquires the word of power, he
    get a journal update
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

void main()
{
    if(GetTag(GetModuleItemAcquired()) == "MPlUsWordofPoQ6"
        && GetLocalInt(GetModule(),"NW_G_M4WORDACQUIRED")==0)
    {
        object oItem = GetObjectByTag("MPlUsWordofPoQ6");
        object oPC = GetItemPossessor(oItem);
        SetLocalInt(GetModule(),"NW_G_M4WORDACQUIRED",1);
        AddJournalQuestEntry("M4Q01_MAIN",25,oPC);
    }
}
