//::///////////////////////////////////////////////
//:: M4Q1_OPENGATE
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Opens the gate when the player walks close to it.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

void main()
{
     if(GetIsPC(GetEnteringObject()))
     {
        object oGate = GetNearestObjectByTag("M4Q1_WARGATE");
        SetLocked(oGate,FALSE);
     }
}
