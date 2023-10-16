//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This should take the book from the player, turn Riv
     towards the trap door, cause a visual effect and
     spawn in the trap door. Also set plot to done.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan whiteside
//:: Created On: Oct 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"

void CreateTrapdoor(location lWP)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, "rdoor", lWP);
}

void main()
{
    //Define Variables
    object oPC = (GetPCSpeaker());
    object oWP = GetWaypointByTag("DOOR_APPEAR");
    location lWP = GetLocation(oWP);
    effect eAppear = EffectVisualEffect(VFX_BEAM_MIND);

    //Set Plot to Finished
    RiviatchHasBook(oPC);
    ActionPauseConversation();
    ActionDoCommand(ClearAllActions());

    //Turns Riviatch around to face trapdoor
    ActionDoCommand(SetFacingPoint(GetPosition(oWP)));

    //Applies Visual Effect to location and spawns in trapdoor
    ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_INSTANT, eAppear, oWP));
    ActionDoCommand(CreateTrapdoor(lWP));
    ActionResumeConversation();

}
