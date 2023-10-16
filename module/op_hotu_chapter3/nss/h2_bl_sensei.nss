//::///////////////////////////////////////////////
//:: Sensei Dharvana, Customized OnBlock Script
//:: H2_Bl_Sensei.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Reissue her movement commands to ensure she
     doesn't get stuck along her day/night cycle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 12, 2003
//:://////////////////////////////////////////////

void main()
{
    ExecuteScript("nw_c2_defaulte", OBJECT_SELF);

    //Ensure that her sleep pattern continues, provided the Sleeping Man isn't
    //awake.
    int bAsleep = GetLocalInt(OBJECT_SELF, "bAsleep");
    object oMan = GetObjectByTag("H2_SleepingMan");
    int bManAwake = GetLocalInt(oMan, "bAwake");
    if (bAsleep == TRUE &&
        bManAwake == FALSE)
    {
        //Move to Asleep location
        object oAsleep = GetObjectByTag("WP_SenseiAsleep");
        location lAsleep = GetLocation(oAsleep);
        float fFacing = GetFacing(oAsleep);
        ActionForceMoveToLocation(lAsleep);
        ActionDoCommand(SetFacing(fFacing));
    }
    else if (bAsleep == FALSE &&
             bManAwake == FALSE)
    {
        //Return to Awake location when meditations are complete.
        object oAwake = GetObjectByTag("WP_SenseiAwake");
        location lAwake = GetLocation(oAwake);
        float fFacing = GetFacing(oAwake);
        ActionForceMoveToLocation(lAwake);
        ActionDoCommand(SetFacing(fFacing));
    }
}
