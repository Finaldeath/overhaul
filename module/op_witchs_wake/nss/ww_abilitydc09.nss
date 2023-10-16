//::///////////////////////////////////////////////
//:: Witchwork Conversation System: DC 9
//:: WW_AbilityDC09.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the Difficulty Check (DC) of the
     upcoming conversation approach to 9.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 28, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "iWW_AbilityDC", 9);
}
