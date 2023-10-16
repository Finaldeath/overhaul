//::///////////////////////////////////////////////
//:: M4_NAKEDSPEAK
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gets the PC to talk to himself as he enters the area
    so he'll know why he's naked and won't worry about
    his stuff.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 18, 2002
//:://////////////////////////////////////////////

void main()
{
    AssignCommand(GetEnteringObject(),ActionSpeakStringByStrRef(57916));
}
