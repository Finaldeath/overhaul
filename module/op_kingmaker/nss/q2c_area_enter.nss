//::///////////////////////////////////////////////
//:: City North On Area Enter
//:: q2c_area_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Enter Script for the City gates
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    if(GetEnteringObject()==oPC)
    {
        //if the pc is leaving the temple having asked for gold
        if(GetLocalInt(oPC,"os_askedforgold")==1)
        {
            //set it so the pc can ask for gold again
            SetLocalInt(oPC,"os_askedforgold",0);
        }
    }

    ExecuteScript("os_cut_gates", OBJECT_SELF);
}
