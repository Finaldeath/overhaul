//::///////////////////////////////////////////////
//:: Aribeth de Tylmarande, Journal Trigger (OnEnter)
//:: H2_En_Ari_Journ.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Add the XP2_Aribeth journal entry indicating
     that the player has seen Aribeth's
     frozen form.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    int bDoOnce = GetLocalInt(GetModule(), "bPlayerEnteredAribethJournalTrigger");
    if (GetIsPC(oPC) == TRUE &&
        bDoOnce == FALSE)
    {
        AddJournalQuestEntry("XP2_Aribeth", 40, oPC, TRUE, TRUE);
        SetLocalInt(GetModule(), "bPlayerEnteredAribethJournalTrigger", TRUE);
    }
}
