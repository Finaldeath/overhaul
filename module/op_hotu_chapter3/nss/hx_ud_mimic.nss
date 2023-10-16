//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_mimic
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will have the mimic jump into position
     for the 2nd cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 14, 2003
//:://////////////////////////////////////////////
#include "mimic_inc"
void main()
{
    int nUser = GetUserDefinedEventNumber();
    location lLoc = GetLocation(GetObjectByTag("h4b_mimic_final_wp"));

    if(nUser == 4567)
    {
        // Turn the Mimic AI off and jump him into place.
        ClearAllActions();
        SetMimicAI(OBJECT_SELF, 0);
        JumpToLocation(lLoc);
    }
}
