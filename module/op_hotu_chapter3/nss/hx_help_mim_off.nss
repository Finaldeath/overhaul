//::///////////////////////////////////////////////
//:: Name hx_help_mim
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Stops the timer on mimic help.
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
            SetLocalInt(GetModule(), "HX_MIMIC_HELP", FALSE);
        }
    }
}
