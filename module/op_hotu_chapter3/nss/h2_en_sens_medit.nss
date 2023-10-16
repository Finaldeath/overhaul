//::///////////////////////////////////////////////
//:: Sensei Dharvana, Meditation Trigger (OnEnter)
//:: H2_En_Sens_Medit.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Make Sensei Dharvana meditate.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 12, 2003
//:://////////////////////////////////////////////

void main()
{
    //Only pay attention to the Sensei and only if she's in Asleep mode and the
    //Sleeping Man is not yet awake.
    object oSensei = GetEnteringObject();
    string sTag = GetTag(oSensei);
    int bAsleep = GetLocalInt(oSensei, "bAsleep");
    object oMan = GetObjectByTag("H2_SleepingMan");
    int bManAwake = GetLocalInt(oMan, "bAwake");
    if (sTag == "H2_Sensei" &&
        bAsleep == TRUE &&
        bManAwake == FALSE)
    {
        //Clear All Actions
        ClearAllActions();

        //Move Sensei to Asleep location
        object oAsleep = GetObjectByTag("WP_SenseiAsleep");
        location lAsleep = GetLocation(oAsleep);
        float fFacing = GetFacing(oAsleep);
        AssignCommand(oSensei, ActionForceMoveToLocation(lAsleep));
        AssignCommand(oSensei, ActionDoCommand(SetFacing(fFacing)));

        //Play Meditation animation
        DelayCommand(2.0, ClearAllActions());
        DelayCommand(2.1, AssignCommand(oSensei, PlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 115.0)));
    }

}
