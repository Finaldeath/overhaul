//::///////////////////////////////////////////////
//:: Start Fires
//:: 2q4_startfires
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Signals the goblins to begin burning books
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 15, 2002
//:://////////////////////////////////////////////

void main()
{
    object oEnter = GetEnteringObject();
    if(GetIsPC(oEnter))
    {
        SetLocalInt(GetArea(OBJECT_SELF), "NW_2Q4_START_BURNING", 1);
    }
}
