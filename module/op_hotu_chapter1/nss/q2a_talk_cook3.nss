//::///////////////////////////////////////////////
//:: Name q2a_talk_cook3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set cook dialog status on PC Speaker
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


void main()
{
    SetLocalInt(GetPCSpeaker(), "nCookDialog", 3);
}
