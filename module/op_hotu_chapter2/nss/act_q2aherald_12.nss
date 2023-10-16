//::///////////////////////////////////////////////
//:: Name   act_q2aherald_12
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Start Battle 1

    Spawn in Attack NOW.
    Disable the old call to start battle 1 (done in the battlestart script)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 8/03
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();

    //Set Up the BattleMaster
    object oBattleMaster = GetObjectByTag("bat1_battlemaster");
    object oArea = GetArea(oBattleMaster);
    SetLocalObject(oBattleMaster, "oPCForCut101", oPC);

    //In fTIMEBATTLESTART seconds - fire the attack cutscene...
    DelayCommand(1.0, ExecuteScript("cutbattlestart", oBattleMaster));

    //Stop other herald messages from happening
    SetLocalInt(GetModule(), "X2_Q2AHeraldMessageSkipped", 1);

}
