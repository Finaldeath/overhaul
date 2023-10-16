//::///////////////////////////////////////////////
//:: m2q3G Castle Guard End Conversation Script #1
//:: m2q3G_GuardE1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if he has already unlocked the
    gate for the player. If so, do a Random Walk.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 31, 2002
//:://////////////////////////////////////////////

void main()
{
    object oGate = GetObjectByTag("m2q3G_CastleGate");

    if (GetLocked(oGate) == FALSE)
    {
        ActionRandomWalk();
    }
}

