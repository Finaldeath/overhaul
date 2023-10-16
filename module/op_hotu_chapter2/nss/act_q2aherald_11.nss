//::///////////////////////////////////////////////
//:: Name   act_q2aherald_11
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Start Battle 1

    Spawn in Attack in fTIMEBATTLESTART seconds.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 8/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"

float fTIMEBATTLESTART = 200.0;

void HeraldSpeak(object oHerald, int nMessage);

void main()
{
    if (GetLocalInt(GetModule(), "X2_Q2ABattle2Started") > 0)
        return;

    SetLocalInt(GetModule(), "X2_Q2AHeraldSpeak", GetLocalInt(GetModule(), "X2_Q2AHeraldSpeak") + 1);

    //Set Up the BattleMaster
    object oBattleMaster = GetObjectByTag("bat1_battlemaster");

    object oArea = GetArea(oBattleMaster);
    object oPC = GetPCSpeaker();
    if (GetIsObjectValid(oPC) == FALSE)
        oPC = OBJECT_SELF;

    SetLocalObject(oBattleMaster, "oPCForCut101", oPC);
    //In fTIMEBATTLESTART seconds - fire the attack cutscene...
    DelayCommand(fTIMEBATTLESTART + 2.0, ExecuteScript("cutbattlestart", oBattleMaster));

    object oHerald = GetObjectByTag("q2aherald");
    DelayCommand(2.0, HeraldSpeak(oHerald, 85724)); //Pickets report the Matron's armies are only minutes away!
    DelayCommand(fTIMEBATTLESTART/3.0, HeraldSpeak(oHerald, 85725));//"The Matron's armies are approaching!"
    DelayCommand(fTIMEBATTLESTART/2.0, HeraldSpeak(oHerald, 85726)); //"The Matron's armies are very close!"
    DelayCommand(fTIMEBATTLESTART/1.5, HeraldSpeak(oHerald, 85727)); //"The Matron's armies are almost here!"
    DelayCommand(fTIMEBATTLESTART, HeraldSpeak(oHerald, 85728));//"The Matron's armies are here!"

    //Make sure the PC is not possessed at the time of the cutscene
    DelayCommand(fTIMEBATTLESTART + 1.0, UnpossessFamiliar(oPC));

}

//Herald only speaks this line if we haven't skipped straight to the Betrayed rebels cutscene already
void HeraldSpeak(object oHerald, int nMessage)
{
    if (GetLocalInt(GetModule(), "X2_Q2ARebelsBetrayed") == 1)
        return;
    if (GetLocalInt(GetModule(), "X2_Q2AHeraldMessageSkipped") == 1)
        return;

    AssignCommand(oHerald, SpeakStringByStrRef(nMessage));
    AssignCommand(oHerald, PlaySoundByStrRef(nMessage));
}
