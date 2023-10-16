//::///////////////////////////////////////////////
//:: Name act_q2blever_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set Rod Colour
    1 = Blue
    2 = Green
    3 = Red
    4 = White
    5 = Yellow
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 16/03
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "nRodColour", 4);

    //Take the rod from the PC
    object oRod = GetLocalObject(OBJECT_SELF, "oRodWhite");
    DestroyObject(oRod);
}
