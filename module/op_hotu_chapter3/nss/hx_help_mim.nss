//::///////////////////////////////////////////////
//:: Name hx_help_mim
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Starts the timer on mimic help.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 24, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();

    if(GetIsPC(oPC))
    {
        // Do once
        if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
            SetLocalInt(GetModule(), "HX_MIMIC_HELP", TRUE);
            // Start timer.
            DelayCommand(180.0, SignalEvent(GetArea(oPC), EventUserDefined(4444)));
        }
    }
}
