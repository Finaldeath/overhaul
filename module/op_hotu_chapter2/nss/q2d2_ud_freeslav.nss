//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q2d2_ud_freeslav
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If not fighting, the free gladiators will
    run for the stairs up.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 14/03
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetAILevel() == AI_LEVEL_VERY_LOW)
            return;
        if (GetIsInCombat() == TRUE)
            return;
        object oTarget = GetWaypointByTag("mn_stairstoentrance");

        ActionMoveToObject(oTarget, TRUE);
    }



}

