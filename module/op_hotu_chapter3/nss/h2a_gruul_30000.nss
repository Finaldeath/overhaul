//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, 30,000 Grinder Repair Price (Action Script)
//:: H2a_Gruul_30000.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the cost of Grinder repair to 30,000.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "iGrinderRepairPrice", 30000);

    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Quarry", 60, oPC, TRUE, TRUE);
}
