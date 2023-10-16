//::///////////////////////////////////////////////
//:: Name act_q2bmirror_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Open the mirror's inventory at end of conversation
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
     object oPC = GetPCSpeaker();

    object oChest = OBJECT_SELF;
    DelayCommand(0.5, AssignCommand(oPC, DoPlaceableObjectAction(oChest, PLACEABLE_ACTION_USE)));

}
