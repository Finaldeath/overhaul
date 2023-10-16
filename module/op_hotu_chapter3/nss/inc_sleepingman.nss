//::///////////////////////////////////////////////
//:: Sleeping Man, Include (Include Script)
//:: Inc_SleepingMan.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle any shared behavior required by the
     Sleeping Man.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

void WakeSleepingMan()
{
    //Wake the Sleeping Man
    object oMan = GetObjectByTag("H2_SleepingMan");
    SetLocalInt(oMan, "bAwake", TRUE);

    //Verify that the Sensei isn't already dead
    object oSensei = GetObjectByTag("H2_Sensei");
    int bDead = GetIsDead(oSensei);
    if (bDead == FALSE)
    {
        //Set a local for later reference, indicating that she made the jump.
        SetLocalInt(GetModule(), "bSenseiJumped", TRUE);

        //Teleport the Sensei in.
        effect eTeleport = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
        location lSensei = GetLocation(oSensei);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTeleport, lSensei);
        object oJumpPoint = GetObjectByTag("WP_SenseiJump");
        DelayCommand(0.2, AssignCommand(oSensei, ClearAllActions()));
        DelayCommand(0.2, SetLocalInt(oSensei, "bAsleep", FALSE));
        DelayCommand(0.4, AssignCommand(oSensei, ActionJumpToObject(oJumpPoint)));
        location lJumpPoint = GetLocation(oJumpPoint);
        DelayCommand(0.4, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTeleport, lJumpPoint));

        //Turn her hostile
        DelayCommand(0.4, ChangeToStandardFaction(oSensei, STANDARD_FACTION_HOSTILE));

        //Move her to the player
        object oPC = GetPCSpeaker();
        DelayCommand(0.6, AssignCommand(oSensei, ActionMoveToObject(oPC, TRUE)));

        //Have her speak her one-liner.
        DelayCommand(2.0, AssignCommand(oSensei, SpeakOneLinerConversation("")));
        /*DEBUG*///DelayCommand(2.0, SendMessageToPC(oPC, "DEBUG: Sensei should speak one-liner now!"));
    }

    //Destroy self (Invisible Placeable).
    DestroyObject(OBJECT_SELF, 2.1);
}
