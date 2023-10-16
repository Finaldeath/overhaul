//::///////////////////////////////////////////////
//:: Witchwork Conversation System: DC 19
//:: WW_AbilityDC19.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the Difficulty Check (DC) of the
     upcoming conversation approach to 19.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 28, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "iWW_AbilityDC", 19);
}
