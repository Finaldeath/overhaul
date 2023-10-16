//::///////////////////////////////////////////////
//:: Name hx_sendpc_to_end
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will send the speaker to the ending.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 1, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
void main()
{
    location lLoc = GetLocation(GetObjectByTag("hx_final_end_movie_wp"));
    object oSelf = OBJECT_SELF;
    SetLocalInt(GetModule(), "X2_MEPH_IS_DEAD", 1);
    CutDisableCutscene(300, 0.0, 0.0, RESTORE_TYPE_NONE);

    while(!GetCommandable())
    {
        SetCommandable(TRUE, oSelf);
    }
    DelayCommand(0.1, ClearAllActions(TRUE));
    //DelayCommand(0.2, ActionJumpToLocation(lLoc));
    DelayCommand(0.3, ActionJumpToLocation(lLoc));
}
