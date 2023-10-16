//::///////////////////////////////////////////////
//:: m2q2CC Area OnEnter Script
//:: m2q2CC
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a player enters the area, update their
    m2q2_Jax journal.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 26, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();

    int iJaxState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm2q2_Jax");

    if (GetIsPC(oPC) && iJaxState > 0)
    {
        AddJournalQuestEntry("m2q2_Jax", 30, oPC);
    }
    if(GetLocalInt(GetModule(),"NW_G_M2Q2CC_AUTOSAVE")==0 && GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M2Q2CC_AUTOSAVE",1);
    }
}
