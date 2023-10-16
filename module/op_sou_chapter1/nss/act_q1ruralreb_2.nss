//::///////////////////////////////////////////////
//:: Name act_q1ruralreb_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//Rumgut quest journal entry -
//Set to 20 unless PC previously killed Nathan
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 9 /03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(GetModule(), "X1_PCKilledNathan") != 1)
        AddJournalQuestEntry("q1footrumgut", 20, oPC);
    else
        AddJournalQuestEntry("q1footrumgut", 70, oPC);
}
