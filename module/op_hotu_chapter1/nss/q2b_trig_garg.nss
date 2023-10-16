//::///////////////////////////////////////////////
//:: Name q2b_trig_garg
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     When this trigger is entered, it will start the
     Gargoyle statue timer.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 5/02
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE  && GetLocalInt(OBJECT_SELF, "nTripped") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nTripped", 1);
        SetLocalInt(GetModule(), "nQ2BGARGTRAPACTIVE", 1);
        ExecuteScript("q2b_run_gargtrap", OBJECT_SELF);
    }

}
