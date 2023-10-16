//::///////////////////////////////////////////////
//:: Name: q2a_endcon_tam1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cutscene 5B will continue after Tamsil finishes
    speaking with the PCs
    Tamsil will leave the Yawning Portal - run to the main
    door and leave.  Fade to black - switch invisible
    PC to the well room where they will see a beholder
    attack Durnan and the 4 adventurers go down into
    the well
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 10/03
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
void main()
{
    if (GetLocalInt(GetModule(), "X2_ypattack")== 3)
    {
        //Durnan speaking variable...
        SetLocalInt(GetModule(), "DurnanSpoke", 3);

        SetLocalInt(OBJECT_SELF, "nRanOff", 1);
        int nPCNumber;
        object oDoor = GetObjectByTag("q2a_yp_int");
        object oWell = GetObjectByTag("q2awell");
        DestroyObject(oWell);

        object oVfxWell = GetObjectByTag("q2a_wellplaceholder");
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(358), oVfxWell);

        object oPC = GetPCSpeaker();
        location lTarget2 = GetLocation(GetWaypointByTag("wp_cut5bwell_x2"));

        //Set well to be open
        SetLocalInt(GetModule(), "NW_WELLROOMOPEN", 10);
        //Set front door open
        //SetLocked(oDoor, FALSE);
        //Tamsil's actions
        ActionMoveToObject(oDoor, TRUE);
        //DelayCommand(4.0, AssignCommand(OBJECT_SELF, ActionJumpToObject(GetWaypointByTag("wp_tamsil1jump"))));
        AssignCommand(OBJECT_SELF, SetIsDestroyable(TRUE));

        DestroyObject(OBJECT_SELF, 4.0);
        ExecuteScript("cut5wellscene", oPC);

    }
}
