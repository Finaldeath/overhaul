//::///////////////////////////////////////////////
//:: Get Lavos' Vote
//:: act_lav_getvote
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC gets Lavos' vote
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oRaf = GetObjectByTag("q2_rafael");
    SetLocalInt(GetModule(),"OS_LAVOS_VOTE",10);
    if(GetLocalInt(GetModule(),"OS_RAFAEL_VOTE")==10)
    {
        AddJournalQuestEntry("q2_priestguild",40,oPC);
    }
    else
    {
        AddJournalQuestEntry("q2_priestguild",20,oPC);
    }
    SetLocalInt(oPC,"os_templeguild_pc",40);
}
