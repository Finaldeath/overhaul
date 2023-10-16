//::///////////////////////////////////////////////
//:: Give Bribe
//:: act_raf_givegold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player gives Rafael his bribe
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oLav = GetObjectByTag("q2_lavos");
    TakeGoldFromCreature(1700,oPC,TRUE);
    SetLocalInt(GetModule(),"OS_RAFAEL_VOTE",10);
    if(GetLocalInt(GetModule(),"OS_LAVOS_VOTE")==10)
    {
        AddJournalQuestEntry("q2_priestguild",40,oPC);
    }
    else
    {
        AddJournalQuestEntry("q2_priestguild",30,oPC);
    }
    SetLocalInt(GetFirstPC(),"os_templeguild_pc",50);
}
