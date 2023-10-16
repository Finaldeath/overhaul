//::///////////////////////////////////////////////
//:: q2c22b_areaenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On enter, the candelabra starts following the player around
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oCandle = GetObjectByTag("q2_candelabra");
    object oPC = GetFirstPC();

    if(GetEnteringObject()==oPC)
    {
        if (GetLocalInt(GetModule(), "OS_SERAH_HOMESOLD") < 30)
        {
            //Ghosts
            DelayCommand(0.5f, DayToNight(oPC));
        }
        else
        {
            //No Ghosts
            DelayCommand(0.5f, NightToDay(oPC));
        }

        if(GetIsObjectValid(oCandle))
        {
            AssignCommand(oCandle, ActionStartConversation(oPC));

            SetLocalObject(oCandle,"OS_PC_CANDELABRA",oPC);
            event eFollow = EventUserDefined(306);
            SignalEvent(oCandle,eFollow);

        }
    }
}
