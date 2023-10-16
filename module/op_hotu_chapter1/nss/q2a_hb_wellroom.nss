//::///////////////////////////////////////////////
//:: Name : q2a_hb_wellroom
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a PC first enters the well room a battle
    will ensue- check to see when the last enemies
    are killed so that Durnan can start his conversation
    with the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Edited By: Brad Prince
//:: Created On: Jan 10/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "X2_ypattack") != 2)
        return;

    object oPC = GetFirstPC();
    object oArea = GetArea(oPC);

    //Check to see if there are still enemies alive
    if (GetLocalInt(GetModule(), "X2_wellmobcount") < 1 && !GetIsDead(oPC) && oArea == OBJECT_SELF)
    {
        //if there are not - set a variable to get Durnan to
        //speak with the PCs again.
        SetLocalInt(GetModule(), "X2_ypattack", 3);
        SetLocalInt(GetModule(), "DurnanSpoke", 2);
        //object oPC = GetFirstObjectInArea(OBJECT_SELF);
        //while (oPC != OBJECT_INVALID)
        //{
        //    if (GetIsPC(oPC))
        //    {
        //        ClearAllActions(TRUE);
                //SetCutsceneMode(oPC, TRUE);
        //        DelayCommand(2.0, AssignCommand(oPC, SetFacingPoint(GetPosition(GetObjectByTag("q2adurnan")))));
        //    }
        //    oPC = GetNextObjectInArea();
       // }
        DelayCommand(2.0, ExecuteScript("cut5well2", OBJECT_SELF));
        //DelayCommand(2.0, ExecuteScript("cut5wellscene", OBJECT_SELF));
    }

}
