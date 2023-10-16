//::///////////////////////////////////////////////
//:: Clear Trial
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Removes all trial participants
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: November 13 2001
//:://////////////////////////////////////////////
#include "MQ3Trial"

void JumpBack(string sJumper, string sDest)
{

    object oJumper =  GetObjectByTag(sJumper);
    SetPlotFlag(oJumper,FALSE);
    if(sJumper == "Rolgan3Q11")
    {
        SetLocalInt(oJumper,"NW_G_M3Q1_TRIALOVER",TRUE);
    }
    object oItemRight=GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oJumper);
    object oItemLeft=GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oJumper);
    effect eDoor = EffectVisualEffect(VFX_IMP_UNSUMMON);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDoor, GetLocation(oJumper));

    AssignCommand(oJumper,JumpToObject(GetObjectByTag(sDest)));
    if (GetTag(oJumper) == "MQ3JUROR3")
    {
        object oLongBow = GetItemPossessedBy(oJumper,"NW_WBWLN001");
        AssignCommand(oJumper,ActionEquipItem(oLongBow,INVENTORY_SLOT_RIGHTHAND));
        AssignCommand(oJumper,ActionUnequipItem(oItemLeft));
    }
    else
    {
        AssignCommand(oJumper,ActionUnequipItem(oItemRight));
        AssignCommand(oJumper,ActionUnequipItem(oItemLeft));
    }

}

void main()
{
   SetLocked(GetObjectByTag("M3Q1A06TrialDoor "),FALSE);
    // * Sets global to number of 'innocent' votes
    SetLocalInt(GetModule(),"NW_G_M3Q01PLOTVERDICT",CountInnocent());

    // * set Prosector's local
    // * so he cannot restart the entire conversation.
    object oProsecutor = GetObjectByTag("Igland3Q11");
    if (GetIsObjectValid(oProsecutor) == TRUE)
    {
        SetLocalInt(oProsecutor,"M3Q1ProsecutionWon",1);
        SetPlotFlag(oProsecutor, FALSE);
    }

    SetLocked(GetObjectByTag("M3Q1A06TrialDoor"),FALSE);


    JumpBack("MQ3JUROR1","M3Q1_EDEGAR_RETURN");
    JumpBack("MQ3JUROR4","M3Q1_AVERIK_RETURN");

    JumpBack("MQ3JUROR3","M3Q1_DALCIA_RETURN");
    JumpBack("MQ3JUROR2","M3Q1_JEVON_RETURN");
    JumpBack("Merc13Q11","M3Q1_LODAR_RETURN");
    JumpBack("MQ3JUROR5","M3Q1_PALLA_RETURN");
    JumpBack("UthgardtWi3Q11","M3Q1_VANDA_RETURN");
    JumpBack("Merc23Q11","M3Q1_ZED_RETURN");

    if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTVERDICT") >= 3)
    {
        JumpBack("Rolgan3Q11","M3Q1_ROLGAN_RETURN");
        if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTVERDICT") > 4)
        {
            AddJournalQuestEntry("M3Q1_TRIAL_PLOT",60,GetPCSpeaker());
        }
        else
        {
            AddJournalQuestEntry("M3Q1_TRIAL_PLOT",50,GetPCSpeaker());
        }
    }
    else
    {
        SetPlotFlag(GetObjectByTag("Rolgan3Q11"),FALSE);
        AddJournalQuestEntry("M3Q1_TRIAL_PLOT",40,GetPCSpeaker());
        DestroyObject(GetObjectByTag("Rolgan3Q11"),1.0);
    }
    DelayCommand(6.0,SetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS",2));
    DestroyObject(GetObjectByTag("Igland3Q11"),3.0);
    object oNeurik = GetObjectByTag("Neurik3Q11");
    SetLocalInt(oNeurik,"NW_G_M3Q1_TRIAL_COMPLETE",TRUE);

}
