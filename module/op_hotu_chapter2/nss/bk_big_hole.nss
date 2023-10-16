//::///////////////////////////////////////////////
//:: bk_big_hole
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player has decided to swim through the
    hole to escape the sinkhole area
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "bk_c2_include"

void main()
{
    // * Play water noise

    // * transport player and all party members
    // * this script used for both the lower and the upper door
    string sDest = "bk_drainout";
    PlaySound("as_na_lavaburst2");
    object oClicker = GetPCSpeaker();
    location lLoc = GetLocation(GetObjectByTag(sDest));
    FadeToBlack(oClicker, FADE_SPEED_FAST);
    AssignCommand(oClicker, DelayCommand(1.0, JumpToLocation(lLoc)));
    JumpAssociates(oClicker, lLoc, TRUE);
    DelayCommand(1.0, FadeFromBlack(oClicker, FADE_SPEED_FAST));

    DelayCommand(10.0, ActionDoCommand(PlaySound("as_na_splash1")));

}
