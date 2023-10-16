//::///////////////////////////////////////////////
//:: Name q1d_endcon_lodar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Lodar's conversation is aborted after the
    kobolds surrender - the mob will kill the
    kobolds.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 23/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "Q1DKoboldSurrender") == 2)
    {

        //the 'kill the kobolds script'
        ExecuteScript("act_q1dlodar_1", OBJECT_SELF);
    }
}
