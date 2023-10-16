//::///////////////////////////////////////////////
//:: Sleeping Dwarf: Trigger
//:: q2b_enter_dark
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Setup the darkness areas when this level is first entered
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: September 23, 2002
//:://////////////////////////////////////////////
#include "x2_inc_restsys"
void main()
{

    if (WMGetAreaHasTable(OBJECT_SELF) == FALSE)
    //Use the correct table for the wandering monsters on this level
        WMSetAreaTable(OBJECT_SELF,"Undermountain1Central");

    object oPC = GetEnteringObject();

    //The first time a PC enters this zone - destroy "Cyphus" (the commoner on the
    //second floor of the Yawning Portal
    //and the bodies of the waterdeep militia in the well room
    if (GetIsPC(oPC) == TRUE)
    {
        //if the PC came from the Yawning Portal - fade them in from black
        if (GetLocalInt(oPC, "X2_MovedFromYPWell") == 1)
        {
            SetLocalInt(oPC, "X2_MovedFromYPWell", 0);
            DoSinglePlayerAutoSave();
            //BlackScreen(oPC);
            //FadeFromBlack(oPC, FADE_SPEED_FAST);
            //Light a couple torches in the entrance area..
            object oTorch1 = GetObjectByTag("q2bentrytorch1");
            object oTorch2 = GetObjectByTag("q2bentrytorch2");
            AssignCommand(oTorch1, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
            AssignCommand(oTorch2, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));

            object oArea = OBJECT_SELF;
            DelayCommand(1.8, RecomputeStaticLighting(oArea));

        }
        if (GetLocalInt(OBJECT_SELF, "nCyphus") == 1)
            return;


        //destroy cyphus
        SetLocalInt(OBJECT_SELF, "nCyphus", 1);
        object oCyphus = GetObjectByTag("Cyphus");
        AssignCommand(oCyphus, ClearAllActions(TRUE));
        AssignCommand(oCyphus, SpeakStringByStrRef(84076));
        DestroyObject(oCyphus, 5.0);

        //destroy old 'dead' guards
        object oGuard1 = GetObjectByTag("cut10_militia1");
        object oGuard2 = GetObjectByTag("cut10_militia2");
        object oGuard3 = GetObjectByTag("cut10_militia3");
        object oGuard4 = GetObjectByTag("cut10_militia4");
        AssignCommand(oGuard1, SetIsDestroyable(TRUE));
        AssignCommand(oGuard2, SetIsDestroyable(TRUE));
        AssignCommand(oGuard3, SetIsDestroyable(TRUE));
        AssignCommand(oGuard4, SetIsDestroyable(TRUE));
        DestroyObject(oGuard1);
        DestroyObject(oGuard2);
        DestroyObject(oGuard3);
        DestroyObject(oGuard4);

        //create new 'live' guards
        CreateObject(OBJECT_TYPE_CREATURE, "q2a_wellguard", GetLocation(GetWaypointByTag("wp_q2a_guard1")));
        CreateObject(OBJECT_TYPE_CREATURE, "q2a_wellguard", GetLocation(GetWaypointByTag("wp_q2a_guard2")));
        CreateObject(OBJECT_TYPE_CREATURE, "q2a_wellguard", GetLocation(GetWaypointByTag("wp_q2a_guard3")));
        CreateObject(OBJECT_TYPE_CREATURE, "q2a_wellguard", GetLocation(GetWaypointByTag("wp_q2a_guard4")));



    }



}
